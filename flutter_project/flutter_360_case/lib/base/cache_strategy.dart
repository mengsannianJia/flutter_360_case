/// 缓存策略 一般默认 cacheOverRemote
enum CacheStrategy {
  /// 仅返回缓存数据,如果缓存没有请求过数据，抛出[NoCachedException]异常
  cacheOnly,

  /// 缓存优先，如果缓存不存在，则获取网络数据，并更新缓存
  cacheOverRemote,

  /// 仅返回网络数据，并更新缓存
  remoteOnly,
}
