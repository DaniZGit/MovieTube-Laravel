-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2022 at 04:55 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movietube_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `created_at`, `updated_at`) VALUES
('Action', NULL, NULL),
('Adventure', NULL, NULL),
('Animation', NULL, NULL),
('Comedy', NULL, NULL),
('Drama', NULL, NULL),
('Family', NULL, NULL),
('Horror', NULL, NULL),
('Psychology', '2022-07-06 12:42:10', '2022-07-06 12:42:10'),
('Sci-Fi', NULL, NULL),
('Sport', NULL, NULL),
('Thriller', '2022-07-06 12:52:39', '2022-07-06 12:52:39');

-- --------------------------------------------------------

--
-- Table structure for table `genre_movie`
--

CREATE TABLE `genre_movie` (
  `movie_id` bigint(20) UNSIGNED NOT NULL,
  `genre_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `genre_movie`
--

INSERT INTO `genre_movie` (`movie_id`, `genre_id`) VALUES
(1, 'Action'),
(1, 'Adventure'),
(1, 'Comedy'),
(2, 'Action'),
(2, 'Adventure'),
(3, 'Action'),
(3, 'Adventure'),
(3, 'Sci-Fi'),
(4, 'Adventure'),
(4, 'Comedy'),
(4, 'Family'),
(5, 'Action'),
(5, 'Adventure'),
(5, 'Sci-Fi'),
(6, 'Comedy'),
(6, 'Drama'),
(6, 'Family'),
(7, 'Action'),
(7, 'Adventure'),
(7, 'Drama'),
(8, 'Action'),
(8, 'Drama'),
(8, 'Sport'),
(26, 'Adventure'),
(26, 'Animation'),
(26, 'Comedy'),
(27, 'Action'),
(27, 'Adventure'),
(27, 'Horror'),
(30, 'Action'),
(30, 'Adventure'),
(30, 'Drama'),
(31, 'Action'),
(31, 'Adventure'),
(31, 'Drama'),
(32, 'Action'),
(32, 'Adventure'),
(32, 'Drama'),
(33, 'Action'),
(33, 'Drama'),
(33, 'Horror'),
(86, 'Drama'),
(86, 'Psychology'),
(86, 'Thriller');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(42, '2022_07_05_101713_create_movie_genres_table', 1),
(47, '2014_10_12_100000_create_password_resets_table', 2),
(48, '2019_08_19_000000_create_failed_jobs_table', 2),
(49, '2019_12_14_000001_create_personal_access_tokens_table', 2),
(50, '2022_07_05_101334_create_movies_table', 2),
(51, '2022_07_05_101555_create_genres_table', 2),
(52, '2022_07_05_101934_create_movie_download_links_table', 2),
(53, '2022_07_05_131000_create_genre_movie_table', 2),
(54, '2014_10_12_000000_create_users_table', 3),
(55, '2022_07_07_003114_create_reviews_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` year(4) NOT NULL,
  `youtube_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `description`, `year`, `youtube_link`, `created_at`, `updated_at`) VALUES
(1, 'Jumanji: Welcome to the Jungle', 'In 1996 Brantford, New Hampshire, teenager Alex Vreeke is given the Jumanji board game by his father, who found it on a beach. Uninterested, he sets the game aside. That night, it transforms into a video-game cartridge that catches Alex\'s attention when the Jumanji drumbeats awaken him. When he begins playing it, he disappears into the game. 20 years later, four students at Brantford High are sentenced to detention: Spence Gilpin and his former friend Anthony \"Fridge\" Johnson for cheating, Bethany Walker for making a phone call during an English test, and Martha Kaply for refusing to participate in gym class and insulting her teacher. In the school basement, where they are serving their detention, Fridge discovers Alex\'s discarded video-game system, and he and Spencer decide to play. Although it has five playable characters, they are unable to select the first one, so they choose two others, and convince the girls to play as the remaining two. When Spencer presses \"Start\", they are transported into the game.', 2017, 'https://www.youtube.com/embed/2QKg5SZ_35I', NULL, NULL),
(2, 'Uncharted', 'Street-smart Nathan Drake (Tom Holland) is recruited by seasoned treasure hunter Victor \"Sully\" Sullivan (Mark Wahlberg) to recover a fortune amassed by Ferdinand Magellan and lost 500 years ago by the House of Moncada. What starts as a heist job for the duo becomes a globe-trotting, white-knuckle race to reach the prize before the ruthless Santiago Moncada (Antonio Banderas), who believes he and his family are the rightful heirs. If Nate and Sully can decipher the clues and solve one of the world\'s oldest mysteries, they stand to find $5 billion in treasure and perhaps even Nate\'s long-lost brother...but only if they can learn to work together.', 2022, 'https://www.youtube.com/embed/eHp3MbsCbMg', NULL, NULL),
(3, 'Spider-man 2', 'On the verge of a nervous breakdown, Peter Parker, now studying physics at the University of Columbia, learns the hard way that life has just got tougher. It\'s been two short years since Norman Osborn\'s death in Spider-Man (2002), and Mary Jane is now giving up on Peter and Aunt May faces imminent foreclosure. As Parker tries to find his feet, uncertain of whether he wants to be a crime-fighter or not, a freak accident in the name of science gives birth to a new super-villain: the obsessed, multi-tentacled mad scientist, Doc Ock. This time, when the world most needs him, Peter must choose between remaining faithful to his calling or staying away from Mary Jane, the girl of his dreams. Will Peter Parker embrace his destiny as Spider-Man, New York City\'s defender?', 2004, 'https://www.youtube.com/embed/3jBFwltrxJw', NULL, NULL),
(4, 'A Series of Unfortunate Events', 'After the tragic death of their parents, Violet (Emily Browning), Klaus (Liam Aiken), and Sunny Baudelaire (Kara and Shelby Hoffman) travel from guardian to guardian by a good friend of their parents, Mr. Poe (Timothy Spall). The orphans stay with herpetologist Montgomery Montgomery (Sir Billy Connolly) and grammar-wise Josephine Anwhistle (Meryl Streep), but the worst one was Count Olaf (Jim Carrey), an evil and greedy man, who, with the help of his assistants, Bald Man (Luis Guzmán), Hook-Handed Man (Jamie Harris), Person of Indeterminate Gender (Craig Ferguson), and the two white-faced women (Jennifer Coolidge and Jane Adams), tries to steal the Baudelaire fortune. To do this, he disguises himself in the forms of assistant Stephano and ship Captain Julio Sham.', 2004, 'https://www.youtube.com/embed/TwSHmixSVao', NULL, NULL),
(5, 'The Hunger Games', 'In order to control future rebellions by remembering the past rebellion, the Powers That Be of the dystopian society of Panem force two youngsters from each of the twelve districts to participate in The Hunger Games. The rules are very simple: the twenty-four players must kill each other and survive in the wilderness until only one remains. The games are broadcast through the Capital and the twelve districts to entertain and intimidate the population. In District 12, teenager Katniss Everdeen is a great hunter and archer. When her younger sister, Primrose Everdeen, is selected as one of the \"tributes\" of their district, Katniss volunteers to take her place in the games. Together with Peeta Mellark, they head by train to the Capital to be prepared for the brutal game.', 2012, 'https://www.youtube.com/embed/mfmrPu43DF8', NULL, NULL),
(6, 'High School Musical', 'Popular basketball player Troy Bolton and Ms.-Einstein Gabriella Montez meet at a ski resort over winter break and are forced to sing karaoke together on New Year\'s Eve; afterwards they exchange numbers. When Troy returns to East High in Albuquerque, New Mexico, surprise. Gabriella is a new classmate. They become friends quickly and decide to audition for the Winter Musical together. They get callbacks and arouse the ire of drama queen Sharpay Evans and her brother Ryan. Troy\'s friend Chad becomes afraid that Troy will become distracted from the basketball championship. Gabriella\'s friend Taylor will do anything to get her on the Decathlon team. Chad and Taylor decide to film Troy saying Gabriella isn\'t important after Chad tricks him into saying it. Taylor shows the video to Gabriella, who refuses to do the callbacks with Troy. Meanwhile, Sharpay and Ryan manipulate the callbacks to the same time as the championship game.\r\n\r\n', 2006, 'https://www.youtube.com/embed/zL4ZEWYsmuw', NULL, NULL),
(7, 'Avengers: Endgame', 'After half of all life is snapped away by Thanos, the Avengers are left scattered and divided. Now with a way to reverse the damage, the Avengers and their allies must assemble once more and learn to put differences aside in order to work together and set things right. Along the way, the Avengers realize that sacrifices must be made as they prepare for the ultimate final showdown with Thanos, which will result in the heroes fighting the biggest battle they have ever faced.', 2019, 'https://www.youtube.com/embed/TcMBFSGVi1c', NULL, NULL),
(8, 'Creed', 'Adonis Johnson lost his mother when he was young and would get into constant trouble and end up in foster care or juvenile detention. One day a woman goes to see him and tells him that her late husband is his father. And her husband\'s boxing great, Apollo Creed. She would take him in and educate him but he feels the need to be a boxer like his father. So he moves to Philadelphia and approaches Rocky Balboa and asks Rocky to train him. Rocky tries to talk him out of it but it\'s something he needs to do. Eventually Rocky offers to train him and when he beats a great boxer and his connection to Apollo is revealed, he is offered a chance to fight a world champion and all he needs to do is take the name Creed.', 2015, 'https://www.youtube.com/embed/Uv554B7YHk4', NULL, NULL),
(26, 'Chip \'n Dale: Rescue Rangers', 'Thirty years after their popular television show ended, chipmunks Chip and Dale live very different lives. When a cast member from the original series mysteriously disappears, the pair must reunite to save their friend.', 2022, 'https://www.youtube.com/embed/F4Z0GHWHe60', NULL, NULL),
(27, 'Morbius', 'Dangerously ill with a rare blood disorder, and determined to save others suffering his same fate, Dr. Morbius attempts a desperate gamble. What at first appears to be a radical success soon reveals itself to be a remedy potentially worse than the disease.', 2022, 'https://www.youtube.com/embed/oZ6iiRrz1SY', NULL, NULL),
(30, 'The Lord of the Rings: The Fellowship of the Ring', 'An ancient Ring thought lost for centuries has been found, and through a strange twist of fate has been given to a small Hobbit named Frodo. When Gandalf discovers the Ring is in fact the One Ring of the Dark Lord Sauron, Frodo must make an epic quest to the Cracks of Doom in order to destroy it. However, he does not go alone. He is joined by Gandalf, Legolas the elf, Gimli the Dwarf, Aragorn, Boromir, and his three Hobbit friends Merry, Pippin, and Samwise. Through mountains, snow, darkness, forests, rivers and plains, facing evil and danger at every corner the Fellowship of the Ring must go. Their quest to destroy the One Ring is the only hope for the end of the Dark Lords reign.', 2001, 'https://www.youtube.com/embed/V75dMMIW2B4', NULL, NULL),
(31, 'The Lord of the Rings: The Two Towers', 'The Fellowship has been broken. Boromir is dead, Frodo Baggins and Samwise Gamgee have gone to Mordor alone to destroy the One Ring, Merry and Pippin have been captured by the Uruk-hai, and Aragorn, Legolas, and Gimli have made friends of the Rohan, a race of humans that are in the path of the upcoming war, led by its aging King, Théoden. The two towers between Mordor and Isengard, Barad-dûr and Orthanc, have united in their lust for destruction. The corrupt wizard Saruman, under the power of the Dark Lord Sauron, and his slimy assistant, Gríma Wormtongue, have created a grand Uruk-hai army bent on the destruction of Man and Middle-earth. The rebellion against Sauron is building up and will be led by Gandalf the White, who was thought to be dead after the Balrog captured him. One of the Ring&#039;s original bearers, the creature Gollum, has tracked Frodo and Sam down in search of his &quot;precious&quot;, but is captured by the Hobbits and used as a way to lead them to Mt. Doom. The War of the Ring has now begun.', 2002, 'https://www.youtube.com/embed/LbfMDwc4azU', NULL, NULL),
(32, 'The Lord of the Rings: The Return of the King', 'The War of the Ring reaches its climax as the Dark Lord Sauron sets his sights on Minas Tirith, the capital of Gondor. The members of the Fellowship in Rohan are warned of the impending attack when Pippin cannot resist looking into Saruman&#039;s palantír and is briefly contacted by the Dark Lord. King Théoden is too proud to send his men to help without being asked, so Gandalf and Pippin ride to Minas Tirith to see that this request is sent. They meet opposition there from Denethor, Steward of the city and father of Faramir and the late Boromir. Denethor&#039;s family has acted as temporary guardians of Gondor for centuries until a member of the true line of Kings returns. This member is none other than Aragorn, who must overcome his own self-doubt before he can take on the role he was destined to fulfill. Meanwhile, Frodo and Sam continue to carry the One Ring towards Mordor, guided by Gollum. What they don&#039;t know is that Gollum is leading them into a trap so that he can reclaim the Ring for himself. Though Sam suspects his deceit, Frodo is starting to be corrupted by the Ring&#039;s power and the mistrust of Sam this causes is fully exploited by Gollum. The only way good can prevail in this contest is if the Ring is destroyed, an event that is becoming harder every minute for Frodo to achieve. The fate of every living creature in Middle-earth will be decided once and for all as the Quest of the Ringbearer reaches its climax.', 2003, 'https://www.youtube.com/embed/r5X-hFf6Bwo', NULL, NULL),
(33, 'It', 'Undoubtedly, something is going on in the once-peaceful late-1980s town of Derry, Maine, as a seemingly endless string of violence, murder, and unaccountable child disappearances terrorise the small community. Against the backdrop of anguished remorse after the recent death of the innocent six-year-old, Georgie Denbrough, the close-knit band of school pariahs, or The Losers&#039; Club--Georgie&#039;s troubled older brother, Bill; the bullied new classmate, Ben Hanscom; the ill-treated, Beverly Marsh; the playful, Richie Tozier; home school kid, Mike Hanlon; the asthmatic, Eddie Kaspbrak; and the fastidious, Stanley Uris--pluck up the courage to confront their well-hidden childhood fears and the blood-curdling clown-like shape-shifter who lives in their twisted visions. Nevertheless, is the malevolent bright-eyed demon, indeed, the nightmarish creature that horrifies Derry? Either way, the otherworldly entity needs to feed, and the young team of defenders are no match for him. Do they have what it takes to face IT?', 2017, 'https://www.youtube.com/embed/hAUTdjf9rko', NULL, NULL),
(86, 'Shutter Island', 'In 1954, up-and-coming U.S. marshal Teddy Daniels is assigned to investigate the disappearance of a patient from Boston\'s Shutter Island Ashecliffe Hospital. He\'s been pushing for an assignment on the island for personal reasons, but before long he thinks he\'s been brought there as part of a twisted plot by hospital doctors whose radical treatments range from unethical to illegal to downright sinister. Teddy\'s shrewd investigating skills soon provide a promising lead, but the hospital refuses him access to records he suspects would break the case wide open. As a hurricane cuts off communication with the mainland, more dangerous criminals \"escape\" in the confusion, and the puzzling, improbable clues multiply, Teddy begins to doubt everything - his memory, his partner, even his own sanity.', 2010, 'https://www.youtube.com/embed/5iaYLCiq5RM', '2022-07-06 12:52:39', '2022-07-06 12:52:39');

-- --------------------------------------------------------

--
-- Table structure for table `movie_download_links`
--

CREATE TABLE `movie_download_links` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `movie_id` bigint(20) UNSIGNED NOT NULL,
  `resolution` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_format` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `movie_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `movie_id`, `user_id`, `comment`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'Kevin Hart and Dwayne Johnson are funny af !', 5.00, NULL, NULL),
(9, 86, 4, 'These new Laravel comments work so smoooooth', 5.00, '2022-07-06 23:12:30', '2022-07-06 23:12:30'),
(10, 86, 1, 'I think the scene where Leo finds his kids in the lake is probably the most well acted scene I\'ve ever seen in my life. I truly believed they were his kids... it just blew me away. I think he deserved an oscar for that performance more than the revenant.', 5.00, '2022-07-06 23:13:29', '2022-07-06 23:13:29'),
(11, 86, 3, 'Like it a lot. The twist isn\'t as mind-blowing as I think it thinks it is, but the path to get there is still a lot of fun.\r\n\r\nThe first time through I was kind of put off by what seemed to be cliche upon cliche and trope upon trope: shady mental institute (for the criminally insane no less), Nazi doctors, vast government conspiracy, over-the-top Gothic aesthetic, etc. But the second time through you realize the movie knows they\'re all cliches, and it plays them up because that\'s exactly what Andrew\'s brain is doing. After that it\'s a fun ride watching Scorsese put his own spin on every overdone genre beat in the book.', 5.00, '2022-07-06 23:14:18', '2022-07-06 23:14:18'),
(12, 2, 1, 'So i think this movie was actually pretty good, was quite impressed by it', 5.00, '2022-07-24 10:06:39', '2022-07-24 10:06:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'daniel123', 'daniel123@gmail.com', NULL, '$2y$10$/Bei6vaRcGpdDi9MwYgB.eAz6u4F8C7hco.CeP9Iqx5muHYYwTk2q', NULL, '2022-07-05 22:19:33', '2022-07-06 11:09:33'),
(2, 'admin', 'admin@gmail.com', NULL, '$2y$10$4za2aB3AOweHJgPozPTsxe6VbPQ8t9O43PYybLQgnUUMStnSwbaoG', NULL, '2022-07-05 22:44:17', '2022-07-05 22:44:17'),
(3, 'lil dickey', 'lildickey@gmail.com', NULL, '$2y$10$uq4O3yd0etkRb5hzqboWGu2yTZPqoGDA3nIUwGsRizg8SFJE4liHm', NULL, '2022-07-06 23:05:26', '2022-07-06 23:06:03'),
(4, 'zanko', 'zanko@gmail.com', NULL, '$2y$10$vIRxJ3FTytxsUehGP/G3DeIag3XjMwYC3rvFbGq38cS/nZ8ZDLk4C', NULL, '2022-07-06 23:06:24', '2022-07-06 23:06:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genre_movie`
--
ALTER TABLE `genre_movie`
  ADD KEY `genre_movie_movie_id_foreign` (`movie_id`),
  ADD KEY `genre_movie_genre_id_foreign` (`genre_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_download_links`
--
ALTER TABLE `movie_download_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_download_links_movie_id_foreign` (`movie_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_movie_id_foreign` (`movie_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `movie_download_links`
--
ALTER TABLE `movie_download_links`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `genre_movie`
--
ALTER TABLE `genre_movie`
  ADD CONSTRAINT `genre_movie_genre_id_foreign` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `genre_movie_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `movie_download_links`
--
ALTER TABLE `movie_download_links`
  ADD CONSTRAINT `movie_download_links_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
