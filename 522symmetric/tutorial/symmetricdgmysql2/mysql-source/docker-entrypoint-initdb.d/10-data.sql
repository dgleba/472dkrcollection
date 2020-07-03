CREATE TABLE `test`
(
  `id` INTEGER AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(256),
  `date` DATE
);

INSERT INTO `test`
(
  `name`,
  `date`
)
VALUES
(
  'foo',
  '2017-07-24'
),
(
  'bar',
  '2017-05-31'
),
(
  'baz',
  '1958-09-29'
),
(
  'quz',
  '1913-07-06'
);


DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `sfdate` date DEFAULT NULL,
  `sfshift` enum('Nights','Days','Afternoons') DEFAULT NULL,
  `reportedby` varchar(99) DEFAULT NULL,
  `field_1` varchar(2000) DEFAULT NULL,
  `zgen` text,
  `miscellaneous` text,
  `createdtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedtime` datetime DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=latin1;

INSERT INTO `item` (`sfdate`, `sfshift`, `reportedby`, `field_1`, `zgen`, `miscellaneous`, `createdtime`, `updatedtime`, `id`) VALUES
('2013-06-25',	'Nights',	'Chad Bernardi',	'ddad',	'',	'a',	'2013-06-25 13:22:53',	'2013-06-25 09:22:30',	12),
('2013-06-25',	'Afternoons',	'Cathy Donohue',	'a',	'a',	'a',	'2013-06-25 14:56:25',	'2013-06-25 10:56:02',	13),
('2020-06-02',	NULL,	'networktest',	'David Gleba 2020-06-07_Sun_12.45-PM',	'a test to see if a connection can be made and record the event.',	'test record from `writetest` routine',	'2020-03-25 01:49:25',	'2020-06-07 16:45:53',	118);
