use context dcic2024
data My-Post:
    post(username :: String, caption :: String, likes :: Number, shares :: Number)
end
post-1 = post("@climates_now", "Artice sea ice hits a record low", 1250, 340)
post-2 = post("@cityfarm", "Our rooftop garden this week", 85, 4)
post-3 = post("@nu_london", "Welcome to week 6!", 410, 12)

feed :: List<My-Post> = [list: post-1, post-2, post-3]

post-1.likes
post-2.username
feed.length()

#functions over a Post
fun engagement(p :: My-Post) -> Number:
  doc: "likes plus shares for a post"
  p.likes + p.shares
where:
  engagement(post-1) is 1590
  engagement(post("@hello", "hello this is James Bond", 0, 0)) is 0
end

fun is-viral(p :: My-Post) -> Boolean:
  doc:"true when a post has more than 1000 likes"
  p.likes > 1000
where:
  is-viral(post-1) is true
  is-viral(post-2) is false
  is-viral(post("@JamesBond", "Hello, My name is James Bond", 1000, 50)) is false
end