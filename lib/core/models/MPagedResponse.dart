class MPagedResponse<T> {
  final int nextStart;
  final List<T> list;

  MPagedResponse({this.nextStart, this.list});
}
