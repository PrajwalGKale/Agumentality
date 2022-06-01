class AvengerLST {
  final String charName;
  final String realName;
  final String Avenger;
  final String planet;
  final String rating;
  final String power;
  final String description;
  AvengerLST(
      {required this.charName,
      required this.realName,
      required this.Avenger,
      required this.planet,
      required this.rating,
      required this.power,
      required this.description});
}

List<AvengerLST> AVGLST = [
  AvengerLST(
      charName: "Black Widow",
      realName: "Natasha Romanoff",
      Avenger: "Avenger",
      planet: "Earth-616",
      rating: "6/10",
      power: "Expert spy, tactician.",
      description:
          "Black Widow (Natalia Alianovna \"Natasha\" Romanova; Russian: Наталья Альяновна \"Наташа\" Романова)[1] is a fictional character appearing in American comic books published by Marvel Comics. Created by editor and plotter Stan Lee, scripter Don Rico, and artist Don Heck, the character debuted in Tales of Suspense"),
  AvengerLST(
      charName: "Hawkeye",
      realName: "Clint Barton",
      Avenger: "Avenger",
      planet: "Earth-616",
      rating: "6/10",
      power: "Expert tactician, acrobat and hand-to-hand combatant",
      description:
          "Hawkeye (Clinton Francis \"Clint\" Barton) is a fictional character appearing in American comic books published by Marvel Comics. Created by writer Stan Lee and artist Don Heck, the character first appeared as a supervillain in Tales of Suspense #57 (September 1964) and later joined the Avengers as a superhero in The Avengers"),
  AvengerLST(
      charName: "Hulk",
      realName: "Bruce Banner",
      Avenger: "Avenger",
      planet: "Sakaar",
      rating: "8/10",
      power: "Immense superhuman strength, speed, stamina, and durability",
      description:
          "The Hulk is a fictional superhero appearing in publications by the American publisher Marvel Comics.Created by writer Stan Lee and artist Jack Kirby, the character first appeared in the debut issue of The IncredibleHulk"),
  AvengerLST(
      charName: "Vision",
      realName: "The Vis",
      Avenger: "Avenger",
      planet: "Earth-616",
      rating: "8.4/10",
      power:
          "Superhuman intelligence, strength, speed Superhuman senses Density control",
      description:
          "The Vision is a fictional superhero appearing in American comic books published by Marvel Comics. Created by Roy Thomas and artist John Buscema,the character first appeared in The Avengers #57 (published in August 1968, with a cover date of October 1968), and is loosely based on the Timely Comics character of the same name who was an alien from another dimension"),
  AvengerLST(
      charName: "Black Panther",
      realName: "T'Challa",
      Avenger: "Avenger",
      planet: "Earth-616",
      rating: "7/10",
      power: "power to draw upon the knowledge",
      description:
          "Black Panther is a fictional character appearing in American comic books published by Marvel Comics. The character was created by writer-editor Stan Lee and artist-coplotter Jack Kirby. The character first appeared in Fantastic Four #52 (cover-dated July 1966) in the Silver Age of Comic Books. Black Panther's real name is T'Challa"),
  AvengerLST(
      charName: "Ironman",
      realName: "Tony Stark",
      Avenger: "Avenger",
      planet: "Earth-616",
      rating: "9.5/10",
      power: "superhuman strength and durability",
      description:
          "Iron Man is a superhero appearing in American comic books published by Marvel Comics. The character was co-created by writer and editor Stan Lee, developed by scripter Larry Lieber, and designed by artists Don Heck and Jack Kirby"),
  AvengerLST(
      charName: "Captain America",
      realName: "Steven Rogers",
      Avenger: "Avenger",
      planet: "Earth-616",
      rating: "10/10",
      power: "Superhuman Agility",
      description:
          "Captain America is a superhero appearing in American comic books published by Marvel Comics. Created by cartoonists Joe Simon and Jack Kirby, the character first appeared in Captain America Comics (cover dated March 1941) from Timely Comics, a predecessor of Marvel Comics"),
  AvengerLST(
      charName: "Scarlet Witch",
      realName: "Wanda Maximoff",
      Avenger: "Avenger",
      planet: "Earth-616",
      rating: "7/10",
      power: "telekinesis, energy manipulation",
      description:
          "The Scarlet Witch (Wanda Maximoff) is a fictional character appearing in American comic books published by Marvel Comics. The character was created by writer Stan Lee and artist Jack Kirby. Her first appearance was in The X-Men #4 (March 1964) in the Silver Age of Comic Books"),
  AvengerLST(
      charName: "Spiderman",
      realName: "Peter Parker",
      Avenger: "Avenger",
      planet: "Earth-616",
      rating: "8.4/10",
      power: "Superhuman Reflexes",
      description:
          "Spider-Man is a superhero appearing in American comic books published by Marvel Comics. Created by writer-editor Stan Lee and artist Steve Ditko, he first appeared in the anthology comic book Amazing Fantasy"),
  AvengerLST(
      charName: "Thor",
      realName: "Thor Odinson",
      Avenger: "Avenger",
      planet: "Asgard",
      rating: "8/10",
      power: "superhuman strength, speed, agility",
      description:
          "Thor is a prominently mentioned god throughout the recorded history of the Germanic peoples, from the Roman occupation of regions of Germania, to the Germanic expansions of the Migration Period, to his high popularity during the Viking Age, when, in the face of the process of the Christianization of Scandinavia"),
  AvengerLST(
      charName: "Loki",
      realName: "Loki Laufeyson",
      Avenger: "Frost Giant",
      planet: "Asgard",
      rating: "6/10",
      power: "superhuman strength, speed, agility",
      description:
          "Loki is a fictional character appearing in American comic books published by Marvel Comics. While the character first appeared in Venus #6 (Aug. 1949), the characterization that has persisted to the modern day, created by writer Stan Lee, scripter Larry Lieber, and penciller Jack Kirby, first appeared in Journey into Mystery"),
  AvengerLST(
      charName: "Doctor Strange",
      realName: "Stephen Strange",
      Avenger: "Avenger",
      planet: "Earth-616",
      rating: "8/10",
      power: "Mastery of magic Utilizes mystical artifacts",
      description:
          "Doctor Stephen Strange is a fictional character appearing in American comic books published by Marvel Comics. Created by Steve Ditko with Stan Leethe character first appeared in Strange Tales #110 . Doctor Strange serves as the Sorcerer Supreme, the primary protector of Earth against magical and mystical threats"),
  AvengerLST(
      charName: "Thanos",
      realName: "Dione",
      planet: "Titan",
      Avenger: "The Mad Titan",
      rating: "8.6/10",
      power: "immensely strong and resistant to injury",
      description:
          "Thanos is a supervillain appearing in American comic books published by Marvel Comics. He was created by writer-artist Jim Starlin, and made his first appearance in The Invincible Iron Man #55 (cover date February 1973). An Eternal–Deviant warlord from the moon Titan"),
];
