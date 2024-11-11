-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4308
-- Generation Time: Nov 11, 2024 at 02:09 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movies_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `discover_movies_tbl`
--

CREATE TABLE `discover_movies_tbl` (
  `iddiscover_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `movies_bookmark_tbl`
--

CREATE TABLE `movies_bookmark_tbl` (
  `bookmark_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `movies_rate_tbl`
--

CREATE TABLE `movies_rate_tbl` (
  `rate_id` int(11) NOT NULL,
  `scale` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `movies_tbl`
--

CREATE TABLE `movies_tbl` (
  `movie_id` int(11) NOT NULL,
  `movie_title` varchar(255) DEFAULT NULL,
  `movie_duration` varchar(45) DEFAULT NULL,
  `movie_image` mediumtext DEFAULT NULL,
  `movie_release_date` varchar(255) DEFAULT NULL,
  `movie_summary` mediumtext DEFAULT NULL,
  `movie_extra_information` mediumtext DEFAULT NULL,
  `movie_story_element` mediumtext DEFAULT NULL,
  `movie_link` mediumtext DEFAULT NULL,
  `movie_categories` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies_tbl`
--

INSERT INTO `movies_tbl` (`movie_id`, `movie_title`, `movie_duration`, `movie_image`, `movie_release_date`, `movie_summary`, `movie_extra_information`, `movie_story_element`, `movie_link`, `movie_categories`) VALUES
(2, 'Venom: The Last Dance', '1h49', 'https://media.pathe.fr/movie/alex/HO00007480/poster/md/58/movie&uuid=EA09B5FD-809D-4111-8D31-D0F173ED5D86', 'Release date : 30 Oct 2024', 'With Chiwetel Ejiofor, Juno Temple, Tom Hardy, by Kelly Marcel', 'Dans VENOM: THE LAST DANCE, ultime opus de la trilogie, Tom Hardy est de retour sous les traits de Venom, l’un des personnages le plus complexes de l’univers Marvel. Eddie et Venom sont en cavale. Chacun est traqué par ses semblables et alors que l’étau se resserre, le duo doit prendre une décision dévastatrice qui annonce la conclusion des aventures d’Eddie & Venom.', 'Directed by : Kelly Marcel\r\nWith : Chiwetel Ejiofor, Juno Temple, Tom Hardy\r\nNationality : Etats-Unis', 'https://www.pathe.fr/en/movies-events/venom-the-last-dance-38422', 'Action/Aventure'),
(3, 'L\'Amour ouf', '2h40', 'https://media.pathe.fr/movie/alex/HO00003500/poster/md/153/movie&uuid=57F7FFC4-CA75-458C-A4C6-DE0A4677E815', 'Release date : 16 Oct 2024', 'With Mallory Wanecque, Adèle Exarchopoulos, François Civil, by Gilles Lellouche', NULL, 'movie_story_element', 'https://www.pathe.fr/en/movies-events/l-amour-ouf', 'Comédie dramatique/Romance'),
(4, 'Monsieur Aznavour', '2h13', 'https://media.pathe.fr/movie/alex/HO00006381/poster/md/118/movie&uuid=9CD278A5-823C-48CB-8C8E-FC5F6EF9837B', 'Release date : 23 oct. 2024', 'With Lionel Cecilio, Tahar Rahim, Bastien Bouillon, by Grand Corps Malade, Mehdi Idir', NULL, 'movie_story_element', 'https://www.pathe.fr/en/movies-events/monsieur-aznavour-35492', 'Biopic/Musical'),
(5, 'JURE N°2', '1h54', 'https://media.pathe.fr/movie/alex/HO00008324/poster/md/27/movie&uuid=37655D4B-6E68-4D14-88CB-C94E58DEAD04', 'Release date : 30 Oct 2024', 'With Nicholas Hoult, Toni Collette, J.K Simmons, by Clint Eastwood', NULL, NULL, 'https://www.pathe.fr/en/movies-events/jure-n-2-42498', 'Drame/Thriller'),
(6, 'Anora', '2h18', 'https://media.pathe.fr/movie/alex/HO00007688/poster/md/70/movie&uuid=8965A8F9-D75E-4DFD-A65A-94BBAEE3D9E9', 'Release date : 30 Oct 2024', 'With Ivy Wolk, Lindsey Normington, Karren Karagulian, by Sean Baker', NULL, NULL, 'https://www.pathe.fr/en/movies-events/anora-38943', 'Drame'),
(7, 'Le Robot Sauvage', '1h42', 'https://media.pathe.fr/movie/alex/HO00007217/poster/md/97/movie&uuid=A8AD4AE6-9E11-412A-B97C-7F6C7A1BCEA9', 'Release date : 09 Oct 2024', NULL, 'DreamWorks Animation présente en exclusivité l’adaptation du roman illustré de Peter Brown, véritable phénomène littéraire, n°1 de la liste des meilleures ventes du New York Times : LE ROBOT SAUVAGE (The Wild Robot). LE ROBOT SAUVAGE suit l’incroyable épopée d\'un robot – l\'unité ROZZUM 7134 alias “Roz” – qui après avoir fait naufrage sur une île déserte doit apprendre à s\'adapter à un environnement hostile en nouant petit à petit des relations avec les animaux de l\'île. Il finit par adopter le petit d’une oie, un oison, qui se retrouve orphelin. Pour les rôles principaux on retrouve les voix de Lupita Nyong\'o® (US, BLACK PANTHER 1 et 2), dans le rôle de Roz le robot, Pedro Pascal (The Last of Us, The Mandalorian) dans celui de Fink le renard, Catherine O\'Hara (Schitt\'s Creek, ARGYLLE) prête son talent à Pinktail l\'opossum, Bill Nighy® (IL ÉTAIT TEMPS, LOVE ACTUALLY) est Longneck l\'oie, Kit Connor (HEARTSTOPPER, ROCKETMAN) interprète Brightbill le petit oison orphelin et Stephanie Hsu® (EVERYTHING EVERYWHERE ALL AT ONCE, THE FALL GUY) est Vontra, un autre robot qui va perturber quelque peu la vie de Roz sur l\'île. Dans les rôles secondaires, se distingue une distribution non moins prestigieuse avec les voix de Mark Hamill, légende de la culture pop (la franchise STAR WARS, LE GARÇON ET LE HERON), Matt Berry (What We Do in the Shadows et la franchise BOB L’ÉPONGE) et Ving Rhames (MISSION : IMPOSSIBLE, PULP FICTION). Cette histoire forte est centrée sur la découverte de soi, une observation passionnante des ponts qui relient nature et technologie tout en explorant avec sensibilité ce que cela signifie d’être au monde et connecté au vivant sous toutes ses formes. LE ROBOT SAUVAGE est écrit et réalisé par Chris Sanders®, à qui on doit notamment la franchise DRAGON pour DreamWorks Animation, LES CROODS et LILO & STITCH pour Disney. Le film est produit par Jeff Hermann (BABY BOSS 2 pour DreamWorks Animation et coproducteur sur la franchise KUNG FU PANDA). Le Robot Sauvage de Peter Brown, est un roman illustré pour les 7-8 ans publié pour la première fois en 2016. Le livre a depuis inspiré une trilogie qui comprend désormais The Wild Robot Escapes et The Wild Robot Protects. Peter Brown est un écrivain à succès qui collectionne les récompenses. Il a notamment reçu : le Caldecott Honor, le Horn Book Award, deux E.B. White Awards, deux E.B. White Honors, un Children\'s Choice Award en qualité d’Illustrateur de l\'année, deux Irma Black Honors, un Golden Kite Award et un New York Times Best Illustrated Book Award.', 'Directed by : Chris Sanders\r\nNationality : Etats-Unis', 'https://www.pathe.fr/en/movies-events/le-robot-sauvage-37764', 'movie_categories'),
(8, 'The Substance', '2h20', 'https://media.pathe.fr/movie/alex/HO00007842/poster/md/35/movie&uuid=D64EEBB3-3E37-41AA-BC26-E21FE566125D', 'Release date : 06 Nov 2024', 'With Dennis Quaid, Demi Moore, Margaret Qualley, by Coralie Fargeat', NULL, NULL, 'https://www.pathe.fr/en/movies-events/the-substance-40005', 'Drame/Epouvante-horreur'),
(9, 'À toute allure', '1h25', 'https://media.pathe.fr/movie/alex/HO00006269/poster/md/40/movie&uuid=9A06F9EF-B612-42C8-AD00-EC347A736622', 'Release date : 06 Nov 2024', 'With Eye Haidara, José Garcia, Pio Marmaï, by Lucas Bernard', NULL, NULL, 'https://www.pathe.fr/en/movies-events/a-toute-allure-35334', 'Comédie/Romance'),
(10, 'Louise Violet', '1h48', 'https://media.pathe.fr/movie/alex/HO00006938/poster/md/126/movie&uuid=C24572C5-7E1A-4435-8DAD-58D9EB698690', 'Release date : 06 Nov 2024', 'movie_summary', '1889. Envoyée dans un village de la campagne française, l’institutrice Louise Violet doit y imposer l’école de la République (gratuite, obligatoire et laïque). Une mission qui ne la rend populaire ni auprès des enfants… ni auprès des parents.', 'Directed by : Éric Besnard\r\nWith : Grégory Gadebois, Alexandra Lamy\r\nNationality : France', 'https://www.pathe.fr/en/movies-events/louise-violet-37065', 'Drame/Historique'),
(11, 'Here - Les plus belles années de notre vie', '1h44', 'https://media.pathe.fr/movie/alex/HO00008278/poster/md/39/movie&uuid=F9887A57-0F1C-4EA9-BC34-78C0071B1DA8', 'Release date : 06 Nov 2024', 'With Robin Wright, Tom Hanks, Paul Bettany, by Robert Zemeckis', 'Toute l’équipe de FORREST GUMP revient au cinéma, et vous transporte dans un voyage unique à travers le temps. L’histoire de familles dont les peines, les joies et les moments de doutes se font écho à travers les générations.', 'Directed by : Robert Zemeckis\r\nWith : Robin Wright, Tom Hanks, Paul Bettany\r\nNationality : Etats-Unis', 'https://www.pathe.fr/en/movies-events/here-les-plus-belles-annees-de-notre-vie-42366', 'Drame'),
(12, 'Croquette le chat merveilleux', '1h27', 'https://media.pathe.fr/movie/alex/HO00007932/poster/md/38/movie&uuid=A53D7CC9-89C7-4861-8877-FDDB629CFDE5', 'Release date : 16 Oct 2024', 'With Simone Ashley, Mo Gilligan, Dylan Llewellyn, by Mark Koetsier, Christopher Jenkins', 'C’est bien connu, les chats ont plusieurs vies ! Croquette vient de gâcher celle de trop et il ferait tout pour retrouver Rose, sa maîtresse adorée. On lui accorde une dernière chance, cependant une règle a changé : Croquette peut revenir, mais à un détail près... Désormais transformé en cheval, chien, perroquet ou poisson, l’aventure ne fait que commencer !', 'Directed by : Mark Koetsier, Christopher Jenkins\r\nWith : Simone Ashley, Mo Gilligan, Dylan Llewellyn\r\nNationality : Canada', 'https://www.pathe.fr/en/movies-events/croquette-le-chat-merveilleux-40221', 'Animation/Comédie/Famille'),
(13, 'Smile 2', '2h12', 'https://media.pathe.fr/movie/alex/HO00007869/poster/md/122/movie&uuid=698F6563-5DAF-4905-83D0-3E76FC7BD898', 'Release date : 16 Oct 2024', 'movie_summary', 'À l’aube d’une nouvelle tournée mondiale, la star de la pop Skye Riley (Naomi Scott) se met à vivre des événements aussi terrifiants qu’inexplicables. Submergée par la pression de la célébrité et devant un quotidien qui bascule de plus en plus dans l’horreur, Skye est forcée de se confronter à son passé obscur pour tenter de reprendre le contrôle de sa vie avant qu’il ne soit trop tard.', 'Directed by : Parker Finn\r\nWith : Dylan Gelula, Kyle Gallner, Lukas Gage\r\nNationality : Etats-Unis', 'https://www.pathe.fr/en/movies-events/smile-2-40082', 'Epouvante-horreur/Thriller'),
(14, 'Le Lac des Cygnes', '2h25', 'https://media.pathe.fr/movie/alex/HO00007836/poster/md/188/movie&uuid=0FDE033A-003E-4221-A174-7A8F8FEF0640', 'Release date : 08 Nov 2024', NULL, NULL, NULL, 'https://www.pathe.fr/en/movies-events/le-lac-des-cygnes-39994', 'Opera'),
(15, 'Transformers : le commencement', '1h45', 'https://media.pathe.fr/movie/alex/HO00002465/poster/md/286/movie&uuid=F4C01B4E-CB5C-40AE-AAF4-78FBF95A8395', 'Release date : 23 Oct 2024', NULL, NULL, NULL, 'https://www.pathe.fr/en/movies-events/transformers-le-commencement-13712', 'Animation/Aventure/Famille'),
(16, 'Flow, le chat qui n’avait plus peur de l’eau', '1h25', 'https://media.pathe.fr/movie/alex/HO00007735/poster/md/45/movie&uuid=444119EF-3FC4-49CE-ADAF-5B2A90971BB7', 'Release date : 30 Oct 2024', NULL, NULL, NULL, 'https://www.pathe.fr/en/movies-events/flow-le-chat-qui-n-avait-plus-peur-de-l-eau-39044', 'Animation/Aventure/Fantastique'),
(17, 'Trois amies', '1h57', 'https://media.pathe.fr/movie/alex/HO00007746/poster/md/30/movie&uuid=8C6D56FE-0E73-4443-AAC5-151BC9757840', 'Release date : 06 Nov 2024', 'With Camille Cottin, Vincent Macaigne, Sara Forestier, by Emmanuel Mouret', NULL, NULL, 'https://www.pathe.fr/en/movies-events/trois-amies-39058', 'Drame'),
(18, 'Ma mini-séance : Pat et Mat un dernier tour de vis', '40min', 'https://media.pathe.fr/movie/alex/HO00008370/poster/md/13/movie&uuid=C0C12A7F-1786-460D-8E3F-8756483BBB48', 'movie_release_date', NULL, '\"Ma Mini-séance\", le rendez-vous pensé pour le bien-être des tout-petits : films courts, son optimisé, lumière tamisée... Découvrez « Pat et Mat, un dernier tour de vis » Les deux inséparables bricoleurs ont toujours des idées à la pelle pour améliorer leur quotidien. Toujours très actifs et jamais à court d’idées, Pat & Mat prolongent leurs péripéties burlesques dans cette nouvelle sélection de courts métrages : Le Tube, Le Popcorn, Les Meubles, Le Lave-auto, La Porte...', 'Directed by : Marek Beneš, Stepan Gajdoš', 'https://www.pathe.fr/en/events/ma-mini-seance-pat-et-mat-un-dernier-tour-de-vis-42585', 'Animation/Famille'),
(19, 'L\'histoire de Souleymane', '1h33', 'https://media.pathe.fr/movie/alex/HO00007682/poster/md/48/movie&uuid=AFD49FCE-BBA7-4C88-93F0-294A24AA8C87', 'Release date : 09 Oct 2024', 'With Abou Sangare, Alpha Oumar Sow, Emmanuel Yovanie, by Boris Lojkine', NULL, NULL, 'https://www.pathe.fr/en/movies-events/l-histoire-de-souleymane-38927', 'Drame'),
(20, '4 Zéros', '1h42', 'https://media.pathe.fr/movie/alex/HO00007584/poster/md/29/movie&uuid=5DEE7182-653B-48F6-9518-9F900FA4BD28', 'Release date : 23 Oct 2024', 'With Gérard Lanvin, Didier Bourdon, Isabelle Nanty, by Fabien Onteniente', NULL, NULL, 'https://www.pathe.fr/en/movies-events/4-zeros-38703', 'Comédie'),
(21, 'Le comte de Monte-Cristo', '2h58', 'https://media.pathe.fr/movie/alex/HO00005576/poster/md/300/movie&uuid=7A8946EA-3C20-4DF8-8D7F-A13175E24353', 'Release date : 28 Jun 2024', NULL, 'Victime d’un complot, le jeune Edmond Dantès est arrêté le jour de son mariage pour un crime qu’il n’a pas commis. Après quatorze ans de détention au château d’If, il parvient à s’évader. Devenu immensément riche, il revient sous l’identité du comte de Monte-Cristo pour se venger des trois hommes qui l’ont trahi.', 'Directed by : Alexandre De La Patellière, Matthieu Delaporte\r\nNationality : France', 'https://www.pathe.fr/en/movies-events/le-comte-de-monte-cristo-20027', 'Aventure/Historique'),
(22, 'Challenger', '1h35', 'https://media.pathe.fr/movie/alex/HO00007041/poster/md/92/movie&uuid=DE20774D-EE8F-4D4E-B9F4-8A85BBF0F57F', 'Release date : 23 Oct 2024', 'With Soso Maness, Alban Ivanov, Audrey Pirault, by Varante Soudjian', NULL, NULL, 'https://www.pathe.fr/en/movies-events/challenger-37290', 'Comédie'),
(23, 'Angelo dans la forêt mystérieuse', '1h22', 'https://media.pathe.fr/movie/alex/HO00006885/poster/md/154/movie&uuid=C470ACAB-B768-4839-9909-32D93CC160DE', 'Release date : 23 Oct 2024', 'With Philippe Katerine, José Garcia, by Vincent Paronnaud, Alexis Ducord', NULL, NULL, 'https://www.pathe.fr/en/movies-events/angelo-dans-la-foret-mysterieuse-36935', 'Animation'),
(24, 'L’Ombre Du Commandant', '1h43', 'https://media.pathe.fr/movie/alex/HO00007889/poster/md/52/movie&uuid=A67ED945-5E48-4C2B-BA70-FBB3EA1EFD29', 'Release date : 06 Nov 2024', 'With Hans Jurgen Höss, Anita Lasker Wallfisch, by Daniela Völker', NULL, NULL, 'https://www.pathe.fr/en/movies-events/l-ombre-du-commandant-40145', 'Documentaire'),
(25, 'Sur un fil', '1h56', 'https://media.pathe.fr/movie/alex/HO00007272/poster/md/42/movie&uuid=78FDDF77-696E-4E1E-840E-41210D259FEE', 'Release date : 30 oct. 2024', 'With Aloïse Sauvage, Philippe Rebbot, Sara Giraudeau, by Reda Kateb', NULL, NULL, 'https://www.pathe.fr/en/movies-events/sur-un-fil-37938', 'Comédie dramatique'),
(26, 'Veer-Zaara', '3h18', 'https://media.pathe.fr/movie/alex/HO00008518/poster/md/2/movie&uuid=F3C7B918-D34F-4A10-A4E1-917A2AB1FAEC', 'Release date : 06 Nov 2024', 'With Rani Mukerji, Shah Rukh Khan, Zinta Preity, by Yash Chopra', NULL, NULL, 'https://www.pathe.fr/en/movies-events/veer-zaara-42926', 'Comédie musicale/Drame/Romance'),
(27, 'Moi, Moche et Méchant 4', '1h34', 'https://media.pathe.fr/movie/alex/HO00004893/poster/md/253/movie&uuid=50BE63C8-999B-4BFE-A7D1-752A6FC7B3AC', 'Release date : 10 Jul 2024', NULL, 'Pour la première fois en sept ans, Gru, le super-vilain le plus populaire du monde, devenu super agent de l’A.V. L, revient dans un nouveau chapitre aussi hilarant que chaotique de la célébrissime saga d’illumination : MOI MOCHE ET MÉCHANT 4. Après le succès des MINIONS 2 : IL ÉTAIT UNE FOIS GRU, qui a rapporté près d\'un milliard de dollars dans le monde entier, la plus grande franchise d\'animation de l\'histoire ouvre un nouveau chapitre où Gru, Lucy et les filles, Margo, Edith et Agnès accueillent le petit dernier de la famille, Gru Junior, qui semble n’avoir qu’une passion : faire tourner son père en bourrique. Mais Gru est confronté à un nouvel ennemi Maxime Le Mal (Will Ferrell) qui, avec l’aide de sa petite amie, la fatale Valentina (Sofia Vergara), va obliger toute la famille à fuir. Le film met en scène de nouveaux personnages interprétés par Joey King (BULLET TRAIN), Stephen Colbert (du Late Show With Stephen Colbert) et Chloe Fineman (du Saturday Night Live). Pierre Coffin reprend l’interprétation devenue légendaire des voix de tous les Minions, et Steve Coogan celle de Silas De La Mollefesse. Pour la version française le public retrouvre les voix de Gad Elmaleh et Audrey Lamy, dans les rôles de Gru et Lucy. MOI, MOCHE ET MÉCHANT 4 est un chapitre trépidant, bourré d’action et de rebondissements. Il est réalisé par Chris Renaud (cité aux Oscars® pour MOI, MOCHE ET MECHANT 2, COMME DES BÊTES) un des deux co-créateurs des Minions, et produit par Chris Meledandri le fondateur visionnaire et PDG d’Illumination. Coréalisé par Patrick Delage (directeur de l’animation sur TOUS EN SCÈNE 2 et COMME DES BÊTES 2), le scénario est signé par Mike White (le créateur de White Lotus récompensé aux Emmy Awards) et Ken Daurio, l’auteur de la franchise depuis le tout premier MOI MOCHE ET MÉCHANT.', 'Directed by : Patrick Delage, Chris Renaud\r\nWith : Pierre Coffin, Steve Carell, Kristen Wiig\r\nNationality : Etats-Unis', 'https://www.pathe.fr/en/movies-events/moi-moche-et-mechant-4-19174', 'Animation/Comédie/Famille'),
(28, 'Vice-Versa 2', '1h36', 'https://media.pathe.fr/movie/alex/HO00005170/poster/md/290/movie&uuid=659CE699-3CEB-4B5B-8E4F-FFD37AA51C06', 'Release date : 19 Jun 2024', NULL, 'Âgée de 13 ans, Riley est désormais une adolescente, ce qui n’est pas sans déclencher un chamboulement majeur au sein du quartier général qui doit faire face à quelque chose d’inattendu : l’arrivée de nouvelles émotions ! Joie, Tristesse, Colère, Peur et Dégoût - qui ont longtemps fonctionné avec succès - ne savent pas trop comment réagir lorsqu’Anxiété débarque. Et il semble qu\'elle ne soit pas la seule...', 'Directed by : Kelsey Mann\r\nWith : Pierre Niney, Charlotte Le Bon, Gilles Lellouche\r\nNationality : Etats-Unis', 'https://www.pathe.fr/en/movies-events/vice-versa-2-19501', 'Animation/Comédie/Famille'),
(29, 'Amaran (version tamoul)', '2h55', 'https://media.pathe.fr/movie/alex/HO00008542/poster/md/6/movie&uuid=09D4F7CA-B7F2-4F7C-A4A2-F8ECFE365D1F', 'Release date : 30 Oct 2024', 'With Sivakarthikeyan, Sai Pallavi, Bhuvan Arora, by Rajkumar Periasamy', NULL, NULL, 'https://www.pathe.fr/en/movies-events/amaran-version-tamoul-43009', 'Action/Biopic/Drame'),
(30, 'Au boulot !', '1h24', 'https://media.pathe.fr/movie/alex/HO00008280/poster/md/2/movie&uuid=6BD41350-FE35-43CE-8410-FE1450CEF6EC', 'Release date : 06 Nov 2024', NULL, NULL, NULL, 'https://www.pathe.fr/en/movies-events/au-boulot-42368', 'Comédie/Documentaire'),
(31, 'L\'affaire Nevenka', '1h57', 'https://media.pathe.fr/movie/alex/HO00007996/poster/md/5/movie&uuid=472B356A-6B49-4576-9C45-8711EF907768', 'Release date : 06 Nov 2024', 'With Mireia Oriol, Lucía Veiga, Carlos Serrano, by Icíar Bollaín', NULL, NULL, 'https://www.pathe.fr/en/movies-events/l-affaire-nevenka-40409', 'Drame'),
(32, 'Séance All Inclusive : Gladiator II', '2h30', 'https://media.pathe.fr/movie/alex/HO00008557/poster/md/9/movie&uuid=C327BAFF-7F16-47C2-80E9-F49582334CD8', 'Release date : 10 Nov 2024', 'With Pedro Pascal, Denzel Washington, Paul Mescal, by Ridley Scott', NULL, NULL, 'https://www.pathe.fr/en/movies-events/seance-all-inclusive-gladiator-ii-43025', 'Action/Drame/Péplum'),
(33, 'Terrifier 3', '2h05', 'https://media.pathe.fr/movie/alex/HO00007556/poster/md/175/movie&uuid=3E1DB444-F4D5-4C3E-A93A-63B569AB72CD', 'Release date : 09 Oct 2024', 'With David Howard Thornton, Lauren LaVera, by Damien Leone', NULL, NULL, 'https://www.pathe.fr/en/movies-events/terrifier-3-38623', 'Epouvante-horreur'),
(34, 'The Apprentice', '2h00', 'https://media.pathe.fr/movie/alex/HO00007687/poster/md/36/movie&uuid=84C55D35-80BC-459B-B6D5-6EB85E5FBB53', 'Release date : 09 Oct 2024', 'With Jeremy Strong, Maria Bakalova, Emily Mitchell, by Ali Abbasi', NULL, NULL, 'https://www.pathe.fr/en/movies-events/the-apprentice-38942', 'Biopic/Drame/Historique'),
(35, 'Beetlejuice Beetlejuice', '1h45', 'https://media.pathe.fr/movie/alex/HO00006250/poster/md/294/movie&uuid=174E120C-BB0B-4D5F-BB9B-A5B17D531A98', 'Release date : 11 Sep 2024', 'With Jenna Ortega, Michael Keaton, Monica Bellucci, by Tim Burton', NULL, NULL, 'https://www.pathe.fr/en/movies-events/beetlejuice-beetlejuice-35311', 'Comédie/Fantastique'),
(36, 'Lee Miller', '1h57', 'https://media.pathe.fr/movie/alex/HO00007576/poster/md/140/movie&uuid=D84A9152-3975-4D4A-BAC1-70E6905600C0', 'Release date : 09 Oct 2024', 'With Jude Law, Kate Winslet, Alexander Skarsgård, by Ellen Kuras', NULL, NULL, 'https://www.pathe.fr/en/movies-events/lee-miller-38695', 'Biopic/Drame/Historique'),
(37, 'Coraline', '1h55', 'https://media.pathe.fr/movie/903830/poster/1663667546496/md/13/film_12354.jpg', 'Release date : 10 Jun 2009', 'With Dakota Fanning, Ian McShane, Teri Hatcher, by Henry Selick', NULL, NULL, 'https://www.pathe.fr/en/movies-events/coraline', 'Animation/Famille/Fantastique'),
(38, 'Le Fil', '1h55', 'https://media.pathe.fr/movie/alex/HO00006719/poster/md/157/movie&uuid=944649FB-E70E-4DB6-964B-2879BBBAA77A', 'Release date : 11 Sep 2024', 'With Daniel Auteuil, Sidse Babett Knudsen, Grégory Gadebois, by Daniel Auteuil', NULL, NULL, 'https://www.pathe.fr/en/movies-events/le-fil-36337', 'Drame'),
(39, 'Megalopolis', '2h18', 'https://media.pathe.fr/movie/alex/HO00007744/poster/md/164/movie&uuid=B3A8CB8F-B901-479D-8409-8324E47AB805', 'Release date : 25 Sep 2024', 'With Aubrey Plaza, Adam Driver, Shia LaBeouf, by Francis Ford Coppola', NULL, NULL, 'https://www.pathe.fr/en/movies-events/megalopolis-39056', 'Drame'),
(40, 'Un p’tit truc en plus', '1h39', 'https://media.pathe.fr/movie/alex/HO00007131/poster/md/63/movie&uuid=58D0446C-D491-497B-9BAD-FE161C2DFC05', 'Release date : 01 May 2024', NULL, 'Pour échapper à la police, un fils (Artus) et son père (Clovis Cornillac) en cavale sont contraints de trouver refuge dans une colonie de vacances pour jeunes adultes en situation de handicap, se faisant passer pour un pensionnaire et son éducateur spécialisé… Le début des emmerdes et d’une formidable expérience humaine qui va les changer à jamais.', 'Directed by : Artus\r\nWith : Alice Belaïdi, Clovis Cornillac, Artus\r\nNationality : France', 'https://www.pathe.fr/en/movies-events/un-p-tit-truc-en-plus-37489', 'Comédie'),
(41, 'Emilia Pérez', '2h12', 'https://media.pathe.fr/movie/alex/HO00007621/poster/md/260/movie&uuid=1276186F-B69A-4A16-AA3C-DB43BB62D463', 'Release date : 21 Aug 2024', 'With Selena Gomez, Edgar Ramírez, Zoe Saldana, by Jacques Audiard', NULL, NULL, 'https://www.pathe.fr/en/movies-events/emilia-perez-38789', 'Comédie musicale/Drame/Thriller'),
(42, 'Blink Twice', '1h42', 'https://media.pathe.fr/movie/alex/HO00007365/poster/md/135/movie&uuid=AD2E68D4-01CF-46B1-8B0F-78A3385856BA', 'Release date : 21 Aug 2024', 'With Channing Tatum, Adria Arjona, Alia Shawkat, by Zoë Kravitz', NULL, NULL, 'https://www.pathe.fr/en/movies-events/blink-twice-38161', 'Epouvante-horreur/Thriller'),
(43, 'The Killer', '2h06', 'https://media.pathe.fr/movie/alex/HO00007994/poster/md/52/movie&uuid=4111DD07-B9EF-46F5-8E14-8418FD50ECB5', 'Release date : 23 Oct 2024', 'With Sam Worthington, Omar Sy, Diana Silvers, by John Woo', 'Lors de l\'exécution de son dernier contrat, un tueur à gage provoque la cécité d\'une jeune chanteuse. Pour trouver l\'argent nécessaire à l\'opération de la jeune femme, il accepte un nouveau contrat.', 'Directed by : John Woo\r\nWith : Sam Worthington, Omar Sy, Diana Silvers\r\nNationality : Etats-Unis', 'https://www.pathe.fr/en/movies-events/the-killer-40381', 'Action'),
(44, 'Barbès, Little Algérie', '1h33', 'https://media.pathe.fr/movie/alex/HO00007780/poster/md/37/movie&uuid=35DF1DB1-4D8A-4D8A-BAC1-462526508A14', 'Release date : 16 Oct 2024', 'With Clotilde Courau, Sofiane Zermani, by François Guerrar', NULL, NULL, 'https://www.pathe.fr/en/movies-events/barbes-little-algerie-39847', 'Drame'),
(45, 'Bloody Beggar (version tamoul)', '2h21', 'https://media.pathe.fr/movie/alex/HO00008543/poster/md/7/movie&uuid=3C746A21-A273-43CD-BA7E-03DE5FD7EB0A', 'Release date : 30 Oct 2024', 'With Redin Kingsley, Kavin Raj, Maruthi Prakashraj, by M. Sivabalan', NULL, NULL, 'https://www.pathe.fr/en/movies-events/bloody-beggar-version-tamoul-43010', 'Comédie/Drame'),
(46, 'Brother (version tamoul)', '2h20', 'https://media.pathe.fr/movie/alex/HO00008544/poster/md/7/movie&uuid=B85CD9FF-4885-4A77-857C-D0183515857C', 'Release date : 30 Oct 2024', 'With Jayam Ravi, Priyanka Arulmohan, M.S. Bhaskar, by M. Rajesh', NULL, NULL, 'https://www.pathe.fr/en/movies-events/brother-version-tamoul-43011', 'Comédie'),
(47, 'Harold et le crayon magique', '1h30', 'https://media.pathe.fr/movie/alex/HO00003713/poster/md/75/movie&uuid=19F93472-7A92-43A5-A35B-ACC1F42179B8', 'Release date : 16 Oct 2024', 'With Lil Rel Howery, Zooey Deschanel, Zachary Levi, by Carlos Saldanha', NULL, NULL, 'https://www.pathe.fr/en/movies-events/harold-et-le-crayon-magique-16112', 'Animation/Comédie/Famille'),
(48, 'L\'Art d\'être heureux', '1h50', 'https://media.pathe.fr/movie/alex/HO00007874/poster/md/35/movie&uuid=120C3524-15C8-4225-B414-A739C1947965', 'Release date : 30 Oct 2024', 'With Benoît Poelvoorde, Camille Cottin, Gustave Kervern, by Stefan Liberski', NULL, NULL, 'https://www.pathe.fr/en/movies-events/l-art-d-etre-heureux-40089', 'Comédie'),
(49, 'Niki', '1h38', 'https://media.pathe.fr/movie/alex/HO00007737/poster/md/101/movie&uuid=17CC13B3-6C98-4BBC-8CE9-49023CFFB80D', 'Release date : 09 Oct 2024', 'With Damien Bonnard, Charlotte Le Bon, by Céline Sallette', NULL, NULL, 'https://www.pathe.fr/en/movies-events/niki-39046', 'Biopic'),
(50, 'Pat et Mat, un dernier tour de vis', '40min', 'https://media.pathe.fr/movie/alex/HO00007355/poster/md/24/movie&uuid=0D7718C0-E041-48D0-ABC6-45D7903813E0', 'Release date : 18 Sep 2024', NULL, NULL, NULL, 'https://www.pathe.fr/en/movies-events/pat-et-mat-un-dernier-tour-de-vis-38151', 'Animation'),
(51, 'Jamais plus - It Ends With Us', '2h11', 'https://media.pathe.fr/movie/alex/HO00007335/poster/md/130/movie&uuid=CA4B0FD7-38B2-4FFE-BBDF-C7BF4B3D3D4C', 'Release date : 14 Aug 2024', 'With Hasan Minhaj, Brandon Sklenar, Blake Lively, by Justin Baldoni', NULL, NULL, 'https://www.pathe.fr/en/movies-events/jamais-plus-it-ends-with-us-38075', 'Drame/Romance'),
(52, 'Toute la beauté et le sang versé', '1h57', 'https://media.pathe.fr/movie/alex/HO00005285/poster/md/90/movie&uuid=9345573F-B724-473D-A75B-9A336CBE1E1A', 'Release date : 15 Mar 2023', 'With Nan Goldin, by Laura Poitras', NULL, NULL, 'https://www.pathe.fr/en/movies-events/toute-la-beaute-et-le-sang-verse-19686', 'Documentaire'),
(53, 'Call Me by Your Name', '2h11', 'https://media.pathe.fr/movie/alex/HO00002492/poster/md/43/movie&uuid=E256F664-B873-4E5B-9992-850D828A5DC1', 'Release date : 28 Feb 2018', NULL, 'Été 1983. Elio Perlman, 17 ans, passe ses vacances dans la villa du XVIIe siècle que possède sa famille en Italie, à jouer de la musique classique, à lire et à flirter avec son amie Marzia. Son père, éminent professeur spécialiste de la culture gréco-romaine, et sa mère, traductrice, lui ont donné une excellente éducation, et il est proche de ses parents.', 'Directed by : Luca Guadagnino\r\nWith : Armie Hammer, Timothée Chalamet, Michael Stuhlbarg\r\nNationality : France', 'https://www.pathe.fr/en/movies-events/call-me-by-your-name', 'Drame/Romance'),
(54, 'Les Graines du figuier sauvage', '2h46', 'https://media.pathe.fr/movie/alex/HO00007768/poster/md/128/movie&uuid=0A668D3B-5DA3-417C-B1A0-D10B50B673F5', 'Release date : 18 Sep 2024', NULL, NULL, NULL, 'https://www.pathe.fr/en/movies-events/les-graines-du-figuier-sauvage-39096', 'Drame'),
(55, 'Lucky Baskhar (version tamoul)', '2h28', 'https://media.pathe.fr/movie/alex/HO00008476/poster/md/13/movie&uuid=2E1CE6DE-EEF7-45DE-8821-B8EED9104937', 'Release date : 30 Oct 2024', NULL, NULL, NULL, 'https://www.pathe.fr/en/movies-events/lucky-baskhar-version-tamoul-42771', 'Drame'),
(56, 'Miséricorde', '1h43', 'https://media.pathe.fr/movie/alex/HO00007675/poster/md/103/movie&uuid=BB80FDBB-5327-4D22-8C44-AAD328279ECE', 'Release date : 16 Oct 2024', 'With Catherine Frot, Félix Kysyl, David Ayala, by Alain Guiraudie', NULL, NULL, 'https://www.pathe.fr/en/movies-events/misericorde-38920', 'Drame'),
(57, 'Singham Again (version hindi)', '2h25', 'https://media.pathe.fr/movie/alex/HO00008481/poster/md/12/movie&uuid=F60908C0-7D36-43C5-A3F0-279E2AD79174', 'Release date : 30 Oct 2024', 'With Ajay Devgn, Kareena Kapoor, Deepika Padukone, by Rohit Shetty', NULL, NULL, 'https://www.pathe.fr/en/movies-events/singham-again-version-hindi-42811', 'Action/Drame'),
(58, 'Conjuring 3 : sous l\'emprise du diable', '1h52', 'https://media.pathe.fr/movie/9201616/poster/md/74/film_925594.jpg', 'Release date : 09 Jun 2021', NULL, 'Conjuring 3 : sous l\'emprise du diable retrace une affaire terrifiante de meurtre et de présence maléfique mystérieuse qui a même ébranlé les enquêteurs paranormaux Ed et Lorraine Warren, pourtant très aguerris. Dans cette affaire issue de leurs dossiers secrets – l\'une des plus spectaculaires – , Ed et Lorrain commencent par se battre pour protéger l\'âme d\'un petit garçon, puis basculent dans un monde radicalement inconnu. Ce sera la première fois dans l\'histoire des États-Unis qu\'un homme soupçonné de meurtre plaide la possession démoniaque comme ligne de défense.', 'Directed by : Michael Chaves\r\nWith : Ruairi O\'Connor, Vera Farmiga, Patrick Wilson\r\nNationality : Etats-Unis', 'https://www.pathe.fr/en/movies-events/conjuring-3-sous-l-emprise-du-diable', 'Epouvante-horreur/Epouvante - Horreur'),
(59, 'Le Garçon et le Héron', '2h05', 'https://media.pathe.fr/movie/alex/HO00006652/poster/md/38/movie&uuid=FBA1CC42-7D90-44D3-A4B5-7C542149C3C2', 'Release date : 01 Nov. 2023', NULL, NULL, NULL, 'https://www.pathe.fr/en/movies-events/le-garcon-et-le-heron-36090', 'Animation/Aventure/Famille'),
(60, 'LE PEUPLE LOUP', '1h43', 'https://media.pathe.fr/movie/9204221/poster/1634903546343/md/58/film_926834.jpg', 'Release date : 20 Oct 2021', 'With Lévanah Solomon, Lana Ropion, Serge Biavan, by Ross Stewart', NULL, NULL, 'https://www.pathe.fr/en/movies-events/le-peuple-loup', 'Animation/Aventure/Famille'),
(61, 'Portrait de la jeune fille en feu', '2h00', 'https://media.pathe.fr/movie/alex/HO00000971/poster/md/88/movie&uuid=44E52DE0-F9A8-430B-8B1C-92188ACEBF37', 'Release date : 18 Sep 2019', 'With Adèle Haenel, Noémie Merlant, Valeria Golino, by Céline Sciamma', NULL, NULL, 'https://www.pathe.fr/en/movies-events/portrait-de-la-jeune-fille-en-feu', 'Drame/Historique'),
(62, 'Carol', '1h58', 'https://media.pathe.fr/movie/alex/HO00001412/poster/md/30/movie&uuid=48429A0A-08D3-431D-A7BF-7EEC5DB611A6', 'Release date : 13 Jan 2016', NULL, 'Dans le New York des années 1950, Therese, jeune employée d’un grand magasin de Manhattan, fait la connaissance d’une cliente distinguée, Carol, femme séduisante, prisonnière d\'un mariage peu heureux. À l’étincelle de la première rencontre succède rapidement un sentiment plus profond. Les deux femmes se retrouvent bientôt prises au piège entre les conventions et leur attirance mutuelle.', 'Directed by : Todd Haynes\r\nWith : Cate Blanchett, Kyle Chandler, Rooney Mara\r\nNationality : Etats-Unis', 'https://www.pathe.fr/en/movies-events/carol', 'Drame/Romance'),
(63, 'Love Lies Bleeding', '1h44', 'https://media.pathe.fr/movie/alex/HO00007648/poster/md/210/movie&uuid=F965B524-03BB-4DFE-B046-66C93C8B89D9', 'Release date : 12 Jun 2024', 'With Anna Baryshnikov, Katy M. O\'Brian, Kristen Stewart, by Rose Glass', NULL, NULL, 'https://www.pathe.fr/en/movies-events/love-lies-bleeding-38874', 'Romance/Thriller'),
(64, '120 battements par minute', '2h23', 'https://media.pathe.fr/movie/alex/HO00001875/poster/md/47/movie&uuid=F5A0C10B-3944-4270-A3F3-2DCD16AADCEE', 'Release date : 23 Aug 2017', 'With Adèle Haenel, Aloïse Sauvage, Antoine Reinartz, by Robin Campillo', NULL, NULL, 'https://www.pathe.fr/en/movies-events/120-battements-par-minute', 'Drame'),
(65, 'Bodyguard', '2h09', 'https://media.pathe.fr/movie/alex/HO00002132/poster/md/6/movie&uuid=BB933D6C-04BE-448C-8F0D-216CEB5285DA', 'Release date : 02 Dec 1992', 'With Whitney Houston, Kevin Costner, by Mick Jackson', NULL, NULL, 'https://www.pathe.fr/en/movies-events/bodyguard', 'Comédie dramatique/Romance'),
(66, 'Conjuring 2 : Le Cas Enfield', '2h14', 'https://media.pathe.fr/movie/alex/HO00001784/poster/md/20/movie&uuid=5E10ACB5-316A-4B82-B7B6-8094464011CF', 'Release date : 29 Jun 2016\r\nRerelease date : 31 Oct 2024', NULL, 'Les époux Warren se rendent dans la banlieue de Londres à la demande d\'un prêtre afin de s\'occuper du cas de Janet, une petite fille de 11 ans possédée par un démon. Peggy, la mère de Janet, ainsi que les soeurs de la fillette, sont terrifiées. Ed et Lorraine se rendent rapidement compte que l\'affaire est sérieuse, et surtout, qu\'ils ne sont pas là par hasard. L\'entité qui a pris possession de Janet les connaît, et les hait assez pour vouloir les éliminer. Le second épisode d\'une franchise d\'horreur dont la réussite ne repose pas uniquement sur sa capacité à faire sursauter le spectateur. Les décors, la musique, les effets sonores : tout concourt à placer le public dans une ambiance sinistre à souhait.', 'Directed by : James Wan\r\nWith : Frances O\'Connor, Bonnie Aarons, Benjamin Haigh\r\nNationality : Etats-Unis', 'https://www.pathe.fr/en/movies-events/conjuring-2-le-cas-enfield', 'Epouvante-horreur'),
(67, 'Conjuring : Les dossiers Warren', '1h50', 'https://media.pathe.fr/movie/alex/HO00001783/poster/md/30/movie&uuid=98BDEA76-DE69-4513-BC59-DA84D77302CC', 'Release date : 21 Aug 2013\r\nRerelease date : 31 Oct 2024', NULL, 'Avant Amityville, il y avait Harrisville… Conjuring : Les dossiers Warren, raconte l\'histoire horrible, mais vraie, d\'Ed et Lorraine Warren, enquêteurs paranormaux réputés dans le monde entier, venus en aide à une famille terrorisée par une présence inquiétante dans leur ferme isolée… Contraints d\'affronter une créature démoniaque d\'une force redoutable, les Warren se retrouvent face à l\'affaire la plus terrifiante de leur carrière…', 'Directed by : James Wan\r\nWith : John Brotherton, Hayley McFarland, Joey King\r\nNationality : Etats-Unis', 'https://www.pathe.fr/en/movies-events/conjuring-les-dossiers-warren', 'Epouvante-horreur'),
(68, 'Dragons', '1h33', 'https://media.pathe.fr/movie/904543/poster/1663667546496/md/50/film_13099.jpg', 'Release date : 31 Mar 2010', NULL, 'L\'histoire d\'Harold, jeune Viking peu à son aise dans sa tribu où combattre les dragons est le sport national. Sa vie va être bouleversée par sa rencontre avec un dragon qui va peu à peu amener Harold et les siens à voir le monde d\'un point de vue totalement différent.', 'Directed by : Chris Sanders, Dean Deblois\r\nWith : Jay Baruchel, Florine Orphelin, Arthur Pestel, Gerard Butler, Emilie Rault, Emmanuel Jacomy, Nathanel Alimi, Donald Reignoux, Julien Kramer, Pascal Grull, Jonah Hill, Christopher Mintz-Plasse, America Ferrera\r\nNationality : Etats-Unis', 'https://www.pathe.fr/en/movies-events/dragons', 'Animation/Aventure'),
(69, 'Hayao Miyazaki and the Heron', '2h00', 'https://www.pathe.fr/assets/source/img/poster-placeholder-pathe-empty.jpg', 'Release date Unknown', NULL, NULL, NULL, 'https://www.pathe.fr/en/movies-events/hayao-miyazaki-and-the-heron-43065', 'Documentaire'),
(70, 'LA NONNE', '1h36', 'https://media.pathe.fr/movie/9102501/poster/1658483546517/md/27/film_923394.jpg', 'Release date : 19 Sep 2018', 'With Demian Bichir, Jonas Bloquet, Taissa Farmiga, by HARDY Corin', NULL, NULL, 'https://www.pathe.fr/en/movies-events/la-nonne', 'Epouvante - Horreur'),
(71, 'La Petite fabrique de nuages', '46min', 'https://media.pathe.fr/movie/alex/HO00002691/poster/md/76/movie&uuid=4D2C61CF-FDFD-4D5E-B2A7-326F8B6D73F5', 'Release date : 13 Mar 2019', NULL, NULL, NULL, 'https://www.pathe.fr/en/movies-events/la-petite-fabrique-de-nuages', 'Animation'),
(72, 'La Soirée STAND UP', '1h30', 'https://media.pathe.fr/movie/alex/HO00007093/poster/md/16/movie&uuid=5220C23F-A6A0-499B-94AD-E95C5F750002', 'Release date : 26 Jan 2024', NULL, NULL, NULL, 'https://www.pathe.fr/en/movies-events/la-soiree-stand-up-37420', 'Divers'),
(73, 'Le Dîner de cons', '1h20', 'https://media.pathe.fr/movie/900176/poster/md/6/film_8807.jpg', 'Release date : 11 Mar 1998', NULL, 'Tous les mercredis, Pierre Brochant et ses amis organisent un dîner où chacun doit amener un con. Celui qui a trouvé le plus spectaculaire est declaré vainqueur. Ce soir, Brochant exulte, il est sur d\'avoir trouvé la perle rare, un con de classe mondiale: Francois Pignon, comptable au ministère des Finances et passionné de modèles réduits en allumettes. Ce qu\'il ignore c\'est que Pignon est passe maître dans l\'art de déclencher des catastrophes.', 'Directed by : Francis Veber\r\nWith : Pétroline Moss, Daniel Prévost, Edgar Givry, Elvire Mellière, Francis Huster, Thierry Lhermitte, Jacques Villeret, Catherine Frot, Alexandra Vandernoot, Philippe Brigaud, Daniel Martin (II), Christian Pereira\r\nNationality : France', 'https://www.pathe.fr/en/movies-events/le-diner-de-cons', 'Comédie'),
(74, 'Les Rendez-vous de l\'animé : Le garçon et le héron', '2h05', 'https://media.pathe.fr/movie/alex/HO00006845/poster/md/18/movie&uuid=59E1E168-4EFA-4CEC-AE6C-7ACAF1F3D732', 'Release date : 30 Oct 2023', 'With Kô Shibasaki, Masaki Suda, Takuya Kimura, by Hayao Miyazaki', NULL, NULL, 'https://www.pathe.fr/en/movies-events/les-rendez-vous-de-l-anime-le-garcon-et-le-heron-36868', 'Animation/Aventure/Drame'),
(75, 'Ni Chaînes Ni Maîtres', '1h38', 'https://media.pathe.fr/movie/alex/HO00007400/poster/md/135/movie&uuid=A1B5DAB9-34F8-47BD-93E8-02CDB8A88B0E', 'Release date : 18 Sep 2024', 'With Anna Thiandoum, Benoît Magimel, Bass Dhem, by Simon Moutaïrou', NULL, NULL, 'https://www.pathe.fr/en/movies-events/ni-chaines-ni-maitres-38248', 'Drame/Historique'),
(76, 'Smaïn déconne finement', '1h15', 'https://www.pathe.fr/assets/source/img/poster-placeholder-pathe-empty.jpg', 'Release date Unknown', 'With Smaïn, by', NULL, NULL, 'https://www.pathe.fr/en/movies-events/smain-deconne-finement-42149', 'Divers'),
(77, 'STARS 80', '1h50', 'https://media.pathe.fr/movie/906373/poster/1647445946320/md/17/film_14993.jpg', 'Release date : 24 Oct 2012', 'With Patrick Timsit, Bruno Lochet, Richard Anconina, by Thomas Langmann, Frédéric Forestier', NULL, NULL, 'https://www.pathe.fr/en/movies-events/stars-80', 'Comédie');

-- --------------------------------------------------------

--
-- Table structure for table `users_tbl`
--

CREATE TABLE `users_tbl` (
  `user_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` mediumtext NOT NULL,
  `role` enum('admin','normal') NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `discover_movies_tbl`
--
ALTER TABLE `discover_movies_tbl`
  ADD PRIMARY KEY (`iddiscover_id`),
  ADD UNIQUE KEY `iddiscover_id_UNIQUE` (`iddiscover_id`),
  ADD KEY `fk_discover_movies_tbl_movies_tbl1_idx` (`movie_id`),
  ADD KEY `fk_discover_movies_tbl_users_tbl1_idx` (`user_id`);

--
-- Indexes for table `movies_bookmark_tbl`
--
ALTER TABLE `movies_bookmark_tbl`
  ADD PRIMARY KEY (`bookmark_id`),
  ADD UNIQUE KEY `bookmark_id_UNIQUE` (`bookmark_id`),
  ADD KEY `fk_movies_bookmark_tbl_users_tbl_idx` (`user_id`),
  ADD KEY `fk_movies_bookmark_tbl_movies_tbl1_idx` (`movie_id`);

--
-- Indexes for table `movies_rate_tbl`
--
ALTER TABLE `movies_rate_tbl`
  ADD PRIMARY KEY (`rate_id`),
  ADD UNIQUE KEY `rate_id_UNIQUE` (`rate_id`),
  ADD KEY `fk_movies_rate_tbl_users_tbl1_idx` (`user_id`),
  ADD KEY `fk_movies_rate_tbl_movies_tbl1_idx` (`movie_id`);

--
-- Indexes for table `movies_tbl`
--
ALTER TABLE `movies_tbl`
  ADD PRIMARY KEY (`movie_id`),
  ADD UNIQUE KEY `movie_id_UNIQUE` (`movie_id`);

--
-- Indexes for table `users_tbl`
--
ALTER TABLE `users_tbl`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `discover_movies_tbl`
--
ALTER TABLE `discover_movies_tbl`
  MODIFY `iddiscover_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies_bookmark_tbl`
--
ALTER TABLE `movies_bookmark_tbl`
  MODIFY `bookmark_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies_rate_tbl`
--
ALTER TABLE `movies_rate_tbl`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies_tbl`
--
ALTER TABLE `movies_tbl`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `users_tbl`
--
ALTER TABLE `users_tbl`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `discover_movies_tbl`
--
ALTER TABLE `discover_movies_tbl`
  ADD CONSTRAINT `fk_discover_movies_tbl_movies_tbl1` FOREIGN KEY (`movie_id`) REFERENCES `movies_tbl` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_discover_movies_tbl_users_tbl1` FOREIGN KEY (`user_id`) REFERENCES `users_tbl` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movies_bookmark_tbl`
--
ALTER TABLE `movies_bookmark_tbl`
  ADD CONSTRAINT `fk_movies_bookmark_tbl_movies_tbl1` FOREIGN KEY (`movie_id`) REFERENCES `movies_tbl` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movies_bookmark_tbl_users_tbl` FOREIGN KEY (`user_id`) REFERENCES `users_tbl` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movies_rate_tbl`
--
ALTER TABLE `movies_rate_tbl`
  ADD CONSTRAINT `fk_movies_rate_tbl_movies_tbl1` FOREIGN KEY (`movie_id`) REFERENCES `movies_tbl` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movies_rate_tbl_users_tbl1` FOREIGN KEY (`user_id`) REFERENCES `users_tbl` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
