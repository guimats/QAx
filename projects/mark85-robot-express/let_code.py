def twoSum(s: str):
    s_list = [char for char in s]
    resp = ''
    hasher = {}
    for idx, i in enumerate(s):
        if hasher.get(i) is not None:
            return [idx]



print(twoSum("pwwkew"))