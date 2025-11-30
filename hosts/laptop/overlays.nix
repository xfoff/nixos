final: prev: {
  winboat = prev.winboat.overrideAttrs (old: {
    makeCacheWritable = true;
    npmFlags = [ "--legacy-peer-deps" ];
  });
}
