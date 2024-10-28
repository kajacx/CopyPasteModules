return function <T>(items: {T}): (function(): (integer, T))
    return pairs(items as {integer: T})
end