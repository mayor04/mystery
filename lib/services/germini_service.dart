// ignore_for_file: avoid_catching_errors, only_throw_errors

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:mystery/app/app.dart';
import 'package:mystery/app/models/event_model.dart';

import '../app/models/story_detail_model.dart';

class GeminiService {
  GenerativeModel _getAIModel({required bool hasOutputFormat}) {
    final model =
        hasOutputFormat ? 'gemini-1.5-pro' : 'gemini-1.5-flash-latest';
    return GenerativeModel(
      model: model,
      apiKey: 'AIzaSyCBudu7zFAmtlWfd8vGPt-P9czn_Ez_VVk',
    );
  }

  Future<String> queryGemini(GeminiQueryModel queryModel) async {
    try {
      final aiModel =
          _getAIModel(hasOutputFormat: queryModel.outputFormat != null);
      final response = await aiModel.generateContent(
        [
          Content.text(queryModel.prompt),
          for (final file in queryModel.files)
            Content.data(
              file.mimeType,
              file.readAsBytesSync(),
            ),
        ],
        generationConfig: GenerationConfig(
          responseSchema: queryModel.outputFormat,
          responseMimeType:
              queryModel.outputFormat != null ? 'application/json' : null,
        ),
      );
      return response.text ?? '';
    } on TimeoutException {
      throw const InternetException();
    } on TypeError catch (e) {
      throw ObjectParserException(data: e);
    } on GenerativeAIException catch (e) {
      throw AppException(message: e.message, data: e);
    } catch (e) {
      throw AppException(
        message:
            'Something went wrong generating your cover letter. Try again later',
        data: e,
      );
    }
  }

  Stream<String> streamGemini(GeminiQueryModel queryModel) {
    try {
      final aiModel =
          _getAIModel(hasOutputFormat: queryModel.outputFormat != null);
      return aiModel.generateContentStream(
        [
          Content.text(queryModel.prompt),
          for (final file in queryModel.files)
            Content.data(
              file.mimeType,
              file.readAsBytesSync(),
            ),
        ],
        generationConfig: GenerationConfig(
          responseSchema: queryModel.outputFormat,
          responseMimeType:
              queryModel.outputFormat != null ? 'application/json' : null,
        ),
      ).map((event) => event.text ?? '');
    } on TimeoutException {
      throw const InternetException();
    } on TypeError catch (e) {
      throw ObjectParserException(data: e);
    } on GenerativeAIException catch (e) {
      throw AppException(message: e.message, data: e);
    } catch (e) {
      throw AppException(
        message:
            'Something went wrong generating your cover letter. Try again later',
        data: e,
      );
    }
  }

  ChatSession? _chatSession;
  String? _sessionId;

  Future<String> initChat(
    StoryDetailsModel story,
    List<EventModel>? messages,
  ) async {
    _chatSession = _getAIModel(hasOutputFormat: true).startChat(
      generationConfig: GenerationConfig(
        responseSchema: Schema.object(
          nullable: false,
          properties: {
            'text': Schema.string(),
            'choices': Schema.array(
              items: Schema.object(
                properties: {
                  'text': Schema.string(),
                  'index': Schema.integer(),
                },
              ),
            ),
          },
        ),
      ),
    );
    // _sessionId = id;
    final res = await _chatSession?.sendMessage(
      Content.text(
        "Generate a scene continuation that follows the user's choice and remains "
        'within the scope of the event and the overall story. The continuation '
        'should be detailed and engaging, creating a sense of immersion for the '
        'user. Include at least three new choices for the user to make at the '
        'end of the continuation '

        // Add the user's choice and the event's context
        'Story: ${story.intro}\n'
        'Event: ${story.events.map((e) => e.toMap()).toList()}\n'
        '${messages != null ? {'previous messages': messages} : null}'

        // Tell AI that the user's choice is the next message
        // "Respond okay now, and then provide the user's choice after the next message"
        'Remember, the responses should be in json format as described in the schema',
      ),
    );
    log(res?.text ?? '');
    return res?.text ?? '';
  }

  Future<String> chatGemini(String choice) async {
    try {
      final response = await _chatSession?.sendMessage(
        Content.text(choice),
      );
      log(response?.text ?? '');
      return response?.text ?? '';
    } on TimeoutException {
      throw const InternetException();
    } on TypeError catch (e) {
      throw ObjectParserException(data: e);
    } on GenerativeAIException catch (e) {
      throw AppException(message: e.message, data: e);
    } catch (e) {
      throw AppException(
        message:
            'Something went wrong generating your cover letter. Try again later',
        data: e,
      );
    }
  }
}

class GeminiQueryModel {
  GeminiQueryModel({
    required this.prompt,
    this.files = const [],
    this.outputFormat,
  });

  final String prompt;
  final List<File> files;
  final Schema? outputFormat;
}

extension FileExtension on File {
  String get name => path.split('/').last;
  String get extension => path.split('.').last;

  String get mimeType {
    switch (extension) {
      case 'jpg':
      case 'jpeg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'webp':
        return 'image/webp';
      case 'mp4':
        return 'video/mp4';
      case 'webm':
        return 'video/webm';
      case 'mov':
        return 'video/quicktime';
      case 'pdf':
        return 'application/pdf';
      case 'txt':
        return 'text/plain';
      default:
        return 'application/octet-stream';
    }
  }
}
