a = [1, 2, 3, 9, 1, 4, 5, 2, 3, 6, 6]

b = a.map { |x| x + 1 }
c = a.map { |x| x.to_f }
d = a.map { |x| x.to_s }
e = a.reject { |x| x < 5 }
f = a.reject { |x| x > 5 }
g = a.inject(0) { |sum, x| sum + x }
h = a.group_by { |x| x.even? }
i = a.group_by { |x| x > 6 if x != 6 }

print b
print c
print d
print e
print f
print g
print h
print i
