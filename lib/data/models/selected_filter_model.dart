import 'dart:ui';

class SelectedFilterModel
{
  final String name ;
   bool selected ;
  SelectedFilterModel({required this.name,required this.selected});
}
class ColorFilterModel
{
  SelectedFilterModel filter ;
 final Color color ;
 ColorFilterModel({required this.filter ,required this.color });
}