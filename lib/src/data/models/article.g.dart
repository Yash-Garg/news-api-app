// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Article _$_$_ArticleFromJson(Map<String, dynamic> json) {
  return _$_Article(
    source: Source.fromJson(json['source'] as Map<String, dynamic>),
    author: json['author'] as String?,
    title: json['title'] as String,
    description: json['description'] as String?,
    url: json['url'] as String,
    urlToImage: json['urlToImage'] as String?,
    publishedAt: DateTime.parse(json['publishedAt'] as String),
    content: json['content'] as String?,
  );
}

Map<String, dynamic> _$_$_ArticleToJson(_$_Article instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'content': instance.content,
    };

_$_Source _$_$_SourceFromJson(Map<String, dynamic> json) {
  return _$_Source(
    id: json['id'] as String?,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$_$_SourceToJson(_$_Source instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
