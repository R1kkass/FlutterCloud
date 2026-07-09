class StreamDTO<T, K, L> {
  final void Function(T)? onListen;
  final void Function(K)? onDone;
  final void Function(L)? onError;
  
  const StreamDTO({
    this.onListen,
    this.onDone,
    this.onError,
  });
}