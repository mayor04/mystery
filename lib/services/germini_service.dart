// ignore_for_file: avoid_catching_errors, only_throw_errors

import 'dart:async';
import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:mystery/app/app.dart';

class GeminiService {
  GenerativeModel _getAIModel({required bool hasOutputFormat}) {
    final model =
        hasOutputFormat ? 'gemini-1.5-pro' : 'gemini-1.5-flash-latest';
    return GenerativeModel(model: model, apiKey: 'apiKey');
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
}

class GeminiQueryModel {
  GeminiQueryModel({
    required this.prompt,
    required this.files,
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
