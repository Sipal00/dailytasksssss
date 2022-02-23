// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class Task {
  IconData? iconData;
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  num? left;
  num? done;
  List<Map<String, dynamic>>? desc;
  bool? isLast;
  Task({
    this.iconData,
    this.title,
    this.bgColor,
    this.iconColor,
    this.btnColor,
    this.left,
    this.done,
    this.desc,
    this.isLast,
  });

  Task copyWith({
    IconData? iconData,
    String? title,
    Color? bgColor,
    Color? iconColor,
    Color? btnColor,
    num? left,
    num? done,
    List<Map<String, dynamic>>? desc,
    bool? isLast,
  }) {
    return Task(
      iconData: iconData ?? this.iconData,
      title: title ?? this.title,
      bgColor: bgColor ?? this.bgColor,
      iconColor: iconColor ?? this.iconColor,
      btnColor: btnColor ?? this.btnColor,
      left: left ?? this.left,
      done: done ?? this.done,
      desc: desc ?? this.desc,
      isLast: isLast ?? this.isLast,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iconData': iconData?.codePoint,
      'title': title,
      'bgColor': bgColor?.value,
      'iconColor': iconColor?.value,
      'btnColor': btnColor?.value,
      'left': left,
      'done': done,
      'desc': desc,
      'isLast': isLast,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      iconData: map['iconData'] != null
          ? IconData(map['iconData'] as int, fontFamily: 'MaterialIcons')
          : null,
      title: map['title'] != null ? map['title'] as String : null,
      bgColor: map['bgColor'] != null ? Color(map['bgColor'] as int) : null,
      iconColor:
          map['iconColor'] != null ? Color(map['iconColor'] as int) : null,
      btnColor: map['btnColor'] != null ? Color(map['btnColor'] as int) : null,
      left: map['left'] != null ? map['left'] as num : null,
      done: map['done'] != null ? map['done'] as num : null,
      //desc: map['desc'] != null ? List<Map<String, dynamic>>.from((map['desc'] as List<int>).map<Map<String, dynamic>?>((x) => x,),) : null,
      isLast: map['isLast'] != null ? map['isLast'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(iconData: $iconData, title: $title, bgColor: $bgColor, iconColor: $iconColor, btnColor: $btnColor, left: $left, done: $done, desc: $desc, isLast: $isLast)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Task &&
        other.iconData == iconData &&
        other.title == title &&
        other.bgColor == bgColor &&
        other.iconColor == iconColor &&
        other.btnColor == btnColor &&
        other.left == left &&
        other.done == done &&
        listEquals(other.desc, desc) &&
        other.isLast == isLast;
  }

  @override
  int get hashCode {
    return iconData.hashCode ^
        title.hashCode ^
        bgColor.hashCode ^
        iconColor.hashCode ^
        btnColor.hashCode ^
        left.hashCode ^
        done.hashCode ^
        desc.hashCode ^
        isLast.hashCode;
  }
}
