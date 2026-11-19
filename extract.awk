{
  line = $0
  gsub(/\r/, "", line)
  sub(/^[ \t]+/, "", line)
  sub(/[ \t]+$/, "", line)
  if (line == "") next
  c = substr(line, 1, 1)
  if (c == "#" || c == "!" || c == ";") next

  n = split(line, f, /[ \t]+/)
  first = f[1]

  skip["localhost"]=1; skip["localhost.localdomain"]=1; skip["local"]=1
  skip["broadcasthost"]=1; skip["ip6-localhost"]=1; skip["ip6-loopback"]=1
  skip["ip6-allnodes"]=1; skip["ip6-allrouters"]=1; skip["ip6-localnet"]=1
  skip["ip6-mcastprefix"]=1; skip["localhost6"]=1; skip["localhost6.localdomain6"]=1
  skip[""]=1

  if (first ~ /^([0-9]{1,3}\.){3}[0-9]{1,3}$/ || first ~ /^::1?$/ || first == "fe80::1%lo0") {
    for (i = 2; i <= n; i++) {
      d = f[i]
      if (d ~ /^#/) break
      gsub(/^\.*/, "", d); gsub(/\.$/, "", d)
      d = tolower(d)
      if (!(d in skip) && d ~ /\./) print d
    }
  } else {
    d = first
    gsub(/^\|\|/, "", d)
    gsub(/\^.*$/, "", d)
    gsub(/^\*\.?/, "", d)
    gsub(/\.$/, "", d)
    d = tolower(d)
    if (!(d in skip) && d ~ /^[a-z0-9]([a-z0-9-]*[a-z0-9])?(\.[a-z0-9]([a-z0-9-]*[a-z0-9])?)+$/) print d
  }
}
