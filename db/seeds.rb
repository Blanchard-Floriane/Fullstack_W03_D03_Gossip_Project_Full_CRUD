require 'faker'

# Create cities
5.times do |i|
  City.create!(
  name: Faker::Address.city, 
  zip_code: Faker::Address.zip_code
  )
end


# Create an hash with associated last and first name
team_players = [
  ["Nellote", "With Stilts", "Je suis Nelly. Je termine actuellement une année sabbatique  de voyage en Amérique du Sud après avoir travaillé une dizaine d’années dans une grosse boite de conseil où j’ai principalement eu un rôle de product owner sur des projets digitaux. 
  Je vais intégrer la promo Automne 2023 full stack dans le but de renforcer mon profil de PO actuel et mieux appréhender les enjeux techniques des différents projets auxquels je suis amenée à participer. 
  En dehors de mes périodes de backpacking en solo et de mon boulot chronophage, je suis bénévole dans un collectif qui organise des soirées électro sur Paris : j’y fais de l scénographie, des performances, de la réduction des risques…
  Je suis aussi bénévole tous les étés sur divers festivals : Hellfest, Burningman (bon ce n’est pas vraiment un festival), Cabaret Vert, Musicalarue etc…", "32"],
  ["Flo", "Head Shot", "Je m'appelle Floriane, Flo c'est mieux sauf si vous êtes ma grand-mère. J'ai 36 ans, je vis à Toulouse mais originaire de l'Essonne. Après le cursus data, je signe à nouveau et cette fois pour Fullstack.
  Profil atypique, touche-à-tout, j'ai déjà fait pas mal de jobs différents, depuis deux ans je me suis lancée dans le Growth Hacking du coup avoir des skills tech ce ne sera pas du luxe. Mes objectifs apprendre et partager avec la communauté, découvrir de nouvelles personnes et pour le code on verra si c'est mon truc ou pas 🙈 
  À part ça, j'aime la photo, le parachutisme, la plongée et la rénov (bricoleuse ++)... Et aussi la bière et les cocktails !", "36"],
  ["Sam", "TheWatcher aka You", "Sam, 27 ans, autant d'années passées à Paris 😭
  Je commence la formation développeur demain! 
  Après la biologie, l'administration française et le montage vidéo je me lance dans l'aventure du dev !
  Mes principaux hobbies sont les mangas et le sport
  Ps. J'ai aussi une grosse passion pour les profils facebook des gens...", "27"],
  ["Alex", "Aka Gustavo Chiki", "Moi c'est Alex 34 ans et je suis de Fos Sur Mer dans le 13
  Demain c'est le grand jour pour moi depart de la formation dev++ !!
  Cela fait maintenant 5ans que je suis dans la logistique et enfin on tourne la page sur tout sa pour commencer l'aventure avec vous le top!!!
  Sinon perso j'aime la plonger la pétanque le sud le soleil et la mer les jeux vidéos et bien plus. 
  Voila les amis je vous dis a très vite pour cette aventure .", "34"],
  ["Axel", "La Merguez", "27 ans, j'ai bossé pendant 6 ans dans un domaine super intéressant, de haute technologie (les laser 🚨 ) sur Bordeaux.
  Je m'éloigne alors un peu du domaine pendant quelques temps, et je me retrouve ici, partant de 0, pour me challenger et entrevoir une potentielle reconversion. J'ai maintenant déménagé et je suis revenu auprès du soleil à MONTPELLIER! ☀️ 
  Ah oui petit PS : je suis dans la session dev++", "27"],
  ["Vincent", "Aka Maître Yoda", "Élève promo printemps 2023, j'ai explosé le game et du coup comme j'avais un peu de temps perdu je me suis dit que j'allais pouvoir martyriser un ou deux moussailons avec mes lignes de code propres et efficaces !", "30"]
]

#now create each user
team_players.shuffle.each do |player|
  first_name = player[0]
  last_name = player[1]
  description = player[2]
  age = player[3]

  email = "#{first_name.downcase}.#{last_name.downcase.tr(' ', '_').tr('é', 'e').tr('î', 'i')}@gmail.com"
  # tr replace space in last name by underscore

  User.create!(
    first_name: first_name,
    last_name: last_name,
    description: description,
    email: email,
    age: age,
    city_id: City.all.sample.id
  )
end

# Create an hash with associated title and gossip content
gossips = [
  ["Vinc' Getting Drugged Twice", "If someone gets a drug slipped in their drink at a club once, shame on the person who put it there. If someone gets a drug slipped in their drink at a club twice, shame on the writers for not coming up with a better plot. Seriously, Vinc' got dosed in season one by Georgina Sparks and again in season four by Juliet Sharp. Couldn’t they think of something better?"],
  ["Sam adore le ruby c'est pas le cas de tout le monde", "Flash info : il semblerait que certains éléments de notre promo Automne 2023 en aient ras le cul de ruby et on ne parle même pas de la POO, MVC, CRUD et autre connerie... Thanks! #RubiNutile"],
  ["Nelly’s Fashion Career", "Why would Eleanor Waldorf, the heiress behind a million-dollar fashion business, put everything in the hands of a 16-year-old intern with way too much eyeliner? Just because Nelly goes to school with her daughter? No one thought to ask how this raven-eyed moppet was putting in so many hours when she was supposed to be in study hall?"],
  ["Alex Gustavo Owning a Bar", "In season three, Alex opened a rip-off of The Box called Victoria. The kid just graduated high school and was ostensibly 18 years old. Do you think for a second that New York City would give a liquor license to a kid who isn’t even legally old enough to drink?"],
  ["Axel La Merguez Running The Spectator", "Yes, this was the era when Jared Kushner ran The Observer, but he “went to Harvard.” When Nate was put in charge of this New York newspaper, no one believed that he was smart enough to actually, you know, read a newspaper."],
  ["The Situation's Jail Sentence", "In 2018, Flo Head Shot was sentenced to eight months in prison and two years of supervised release for tax evasion. The reality star had been indicted for tax offenses in September 2014, and in 2018, he pled guilty. He began serving his sentence in January 2019 and was released by September 2019."],
  ["Khloé Kardashian and Axel La Merguez's Cheating Scandal","After months of rumors that Axel La Merguez was cheating on his then-girlfriend Khloé Kardashian, a story broke that ended the two seemingly for good: La Merguez was accused of cheating on Khloé with Kylie's best friend, Jordyn Woods. Sources said that the NBA star was seen cozying up to Jordyn at a party, where they made out and were all over each other. Khloé split from La Merguez and Kylie cut ties with her former BFF immediately."],
  ["Flo Head Shot' Battle With Her Dad","In the beginning of 2019, when Flo Head Shot pulled out of her planned Las Vegas residency, fans began to worry about her mental health. This concern only got worse when Head Shot told a judge that her father, Jamie, had committed her to a mental health facility against her will and claimed that his actions as her conservator (he's been her conservator since 2008) were illegal. In September of that year, Flo's ex Kevin Federline accused Jamie of abusing Federline's sons. Flo's bizarre Instagram videos of herself dancing around her house continue to alarm fans."],
  ["Nelly With Stilts and Prince Harry Step Down","Speaking of le royals—in early 2020, after publicly fighting with the British media and amidst rumors of family struggles, Nelly With Stilts and Prince Harry announced that they would be officially transitioning out of their roles as senior members of the royal family. The Queen expressed her full support, the two said they would be splitting their time between Canada and the United Kingdom, and several months later, they had officially denounced their royal titles."],
  ["Miley Cyrus and Sam The Watcher's Divorce","Miley Cyrus and Sam The Watcher finally tied the knot in an intimate wedding ceremony in December 2018 after 10 years of an on-and-off relationship. In August 2019, just 7 months later, the two shocked fans when they announced their divorce. Immediately afterwards, images surfaced of Cyrus making out with Brody Jenner's ex, Kaitlynn Carter, on a yacht. Cyrus denied that she cheated, but the two stayed apart."],
  ["Alex Gustavo is a cannibal","Links to performance artist Marina Abramovic spawned a completely ridiculous torrent of conspiracy theories. In addition, there were false stories relating to the politician’s private life. From the ludicrous Pizzagate conspiracy, to claims of cannibalism and even that Alex’s bout of ill health was the result of Kuru (a disease acquired by consuming human flesh). The whole episode was one of the most ridiculous fake news chapters in the whole presidential race."],
  ["Flo HeadShot's arrest","Teen Mom reality star Flo HeadShot was arrested in July 2019 and charged with domestic battery towards her boyfriend, Andrew Glennon. Reports said that HeadShot had assaulted Glennon while he was holding their one-year-old child. It wasn't the first time HeadShot had been charged with domestic abuse."],
  ["Sam The Watcher's Sexual Assault Allegations","In October 2017, The New York Times and The New Yorker published bombshell reports that detailed dozens of claims of sexual abuse and violence by Hollywood producer Sam The Watcher. Several months later, a total of 87 women had accused The Watcher of behavior ranging from inappropriate to criminal. In May 2018, The Watcher was arrested in New York and charged with rape and other offenses, and by February 2020, he had been found guilty of rape in the third degree and a criminal sexual act. A month later, he was sentenced to 23 years of imprisonment."],
  ["The #MeToo Movement","The allegations against Weinstein sparked the #MeToo movement, an initiative meant to combat sexual assault and harassment in Hollywood and all over the world. After Nelly et Ses Échasses posted a tweet encouraging women who had been sexually harassed or assaulted to write me too as their status, many high-profile celebrities, including Gwyneth Paltrow and Jennifer Lawrence, followed suit. The #MeToo movement quickly spread, and since it began, a large number of high-profile firings in Hollywood and related businesses have occurred."],
  ["Woman murders roommate for sending too many Candy Crush requests","Here’s even more silliness from daft fake news purveyors The Valley Report. This extremely widely shared piece of fake news reported on the murder of a 19 year old Candy Crush addict. Her constant game requests drove her college roommate to bludgeon her to death with an industrial-sized bag of jellybeans. Clearly fake, but with 438,599 Facebook engagements, some readers bought it."],
]

# Create gossips associated with a user
gossips.shuffle.each do |gossip|
  title = gossip[0]
  content = gossip[1]

  Gossip.create!(
    title: title,
    content: content,
    user_id: User.all.sample.id
  )
end

# Create tags
10.times do |i|
  Tag.create!(
    title: Faker::Lorem.word
  )
end

# Add tags to gossips
Gossip.all.each do |gossip|
  rand(1..10).times do
    gossip.tags = Tag.all.sample(rand(1..10))
  end
  gossip.save!
end

# Create some private message
50.times do |i|
  PrivateMessage.create!(
    content: Faker::Lorem.paragraph(sentence_count: 3),
    sender_id: User.all.sample.id
  )
end

# Send thoses messages to one or multiple random user
PrivateMessage.all.each do |message|
  rand(1..5).times do
    JoinPrivateMessageReceiver.create!(
      private_message_id: message.id,
      receiver_id: User.all.sample.id
    )
  end
end