/*
 * Author: lin.zehong 
 * Date: 2020-07-03 17:15:04 
 * Desc: 日期时间组件
 */
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

const String MIN_DATE = '1980-01-01';
const String MAX_DATE = '2100-01-01';
const String FORMAT_DATE = 'yyyy-MMMM-dd';
const String MIN_DATETIME = '1980-01-01 09:00:00';
const String MAX_DATETIME = '2100-00-01 21:00:00';
const String FORMAT_DATETIME = 'yyyy-MM-dd HH时:mm分';
// const String FORMAT_DATETIME = 'yyyy-MM-dd HH时:mm分:ss秒';

// const String _format = 'yyyy年MM月dd日    H时:m分';
// const String _format = 'yy年M月d日    EEE,H时:m分';

class DateTimePage {
  DateTimePickerLocale _locale = DateTimePickerLocale.zh_cn;
  // DateTime _dateTime = DateTime.now();

  @required
  BuildContext context;
  String format;
  Function onConfirm;
  Function onClose;
  Function onCancel;
  DateTime initialDateTime;

  DateTimePage(
    this.context, {
    this.initialDateTime,
    this.format,
    this.onConfirm,
    this.onCancel,
    this.onClose,
  });

  // 日期
  void showDatePicker() {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
        showTitle: true,
        cancel: Text('取消', style: TextStyle(color: Colors.blue)),
        confirm: Text('确定', style: TextStyle(color: Colors.blue)),
      ),
      minDateTime: DateTime.parse(MIN_DATE),
      maxDateTime: DateTime.parse(MAX_DATE),
      initialDateTime: this.initialDateTime,
      // pickerMode: DateTimePickerMode.time, // show TimePicker
      locale: _locale,
      dateFormat: this.format ?? FORMAT_DATE,
      onClose: onClose,
      onCancel: onCancel,
      onConfirm: (dateTime, List<int> index) {
        this.onConfirm(dateTime);
      },
    );
  }

  // 日期时间
  void showDateTimePicker() {
    DatePicker.showDatePicker(
      context,
      onMonthChangeStartWithFirstDate: true,
      pickerTheme: DateTimePickerTheme(
        showTitle: true,
        cancel: Text('取消', style: TextStyle(color: Colors.blue)),
        confirm: Text('确定', style: TextStyle(color: Colors.blue)),
      ),
      minDateTime: DateTime.parse(MIN_DATETIME),
      maxDateTime: DateTime.parse(MAX_DATETIME),
      initialDateTime: this.initialDateTime,
      pickerMode: DateTimePickerMode.time, // show TimePicker
      locale: _locale,
      dateFormat: this.format ?? FORMAT_DATETIME,
      onClose: onClose,
      onCancel: onCancel,
      onConfirm: (dateTime, List<int> index) {
        this.onConfirm(dateTime);
      },
    );
  }
}
