-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 22-10-2018 a las 01:07:52
-- Versión del servidor: 5.7.23-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hackBlog`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id_comentario` int(10) UNSIGNED NOT NULL,
  `autor` varchar(255) COLLATE utf8_bin NOT NULL,
  `texto` text COLLATE utf8_bin NOT NULL,
  `fecha` datetime NOT NULL,
  `id_noticia` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id_comentario`, `autor`, `texto`, `fecha`, `id_noticia`) VALUES
(1, 'echodelta', 'The samba beat comes from two frogs. One big one goes boorup, the other goes be-be-be…..be-be-be. Probably goes on all night long.', '2018-10-01 09:35:33', 3),
(2, 'Gijs', 'i love it.', '2018-10-10 10:38:35', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `id_noticia` int(10) UNSIGNED NOT NULL,
  `titular` varchar(255) COLLATE utf8_bin NOT NULL,
  `entradilla` text COLLATE utf8_bin NOT NULL,
  `cuerpo` text COLLATE utf8_bin NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id_noticia`, `titular`, `entradilla`, `cuerpo`, `fecha`) VALUES
(1, 'The Crystal (Testing) Method', 'It used to be any good electronics experimenter had a bag full of crystals because you never knew what frequency you might need. These days, you are likely to have far fewer because you usually just need one reference frequency and derive all the other frequencies from it. But how can you test a crystal?', '<p>It used to be any good electronics experimenter had a bag full of crystals because you never knew what frequency you might need. These days, you are likely to have far fewer because you usually just need one reference frequency and derive all the other frequencies from it. But how can you test a crystal? As [Mousa] points out in a recent video, you can’t test it with a multimeter.</p>\r\n\r\n<p>His approach is simple: Monitor a function generator with an oscilloscope, but put the crystal under test in series. Then you move the frequency along until you see the voltage on the oscilloscope peak. That frequency should match the crystal’s operating frequency.</p>\r\n\r\n<p>It is interesting that because of the resonance of the crystal, the voltage on the scope can be much higher than the input voltage from the signal generator. This is a simple test, but effective. Of course, you could also have a little oscillator and see what the crystal does in a real circuit./p>\r\n\r\n<p>We’ve tested crystals before with a network analyzer and we even made a video that shows essentially the same test [Mousa] uses, although it was on an LC circuit, not a crystal. You do need to be careful you aren’t operating the crystal in an overtone mode by accident, although presumably if it works on a harmonic, it should work on the fundamental frequency, too. We’ve also seen crystal testing and classification done with a software defined radio.</p>', '2018-10-20 08:34:26'),
(2, 'I2C Bootloader for ATtiny85 Lets Other Micros Push Firmware Updates', 'There are a few different ways of getting firmware onto one of AVR’s ATtiny85 microcontrollers, including bootloaders that allow for firmware to be updated without the need to plug the chip into a programmer.', '<p>There are a few different ways of getting firmware onto one of AVR’s ATtiny85 microcontrollers, including bootloaders that allow for firmware to be updated without the need to plug the chip into a programmer. However, [casanovg] wasn’t satisfied with those so he sent us a tip letting us know he wrote an I2C bootloader for the ATtiny85 called Timonel. It takes into account a few particulars of the part, such as the fact that it lacks a protected memory area where a bootloader would normally reside, and it doesn’t have a native I2C interface, only the USI (Universal Serial Interface). He’s just released the first functional version for the ATtiny85, but there’s no reason it couldn’t be made to work with the ATtiny45 and ATtiny25 as well.</p>\r\n\r\n<p>Timonel is designed for systems where there is a more powerful microcontroller or microprocessor running the show (such as an ESP8266, Arduino, or even a board like a Raspberry Pi.) In designs where the ATtinys are on an I2C bus performing peripheral functions such as running sensors, Timonel allows the firmware for these peripheral MCUs to be updated directly from the I2C bus master. Embedded below is a video demo of [casanovg] sending simple serial commands, showing a successful firmware update of an AVR ATtiny85 over I2C.</p>', '2018-10-09 11:20:35'),
(3, 'Hacking Nature’s Musicians', 'We just wrapped up the Musical Instrument Challenge in the Hackaday Prize, and for most projects that meant replicating sounds made by humans, or otherwise making musicians for humans. There’s more to music than just what can be made in a DAW, though.', '<p>We just wrapped up the Musical Instrument Challenge in the Hackaday Prize, and for most projects that meant replicating sounds made by humans, or otherwise making musicians for humans. There’s more to music than just what can be made in a DAW, though; the world is surrounded by a soundscape, and you only need to take a walk in the country to hear it.</p>\r\n\r\n<p>For her Hackaday Prize entry, [Kelly] is hacking nature’s musicians. She’s replicating the sounds of the rural countryside in transistors and PCBs. It’s an astonishing work of analog electronics, and it sounds awesome, too.</p>\r\n\r\n<p>The most impressive board [Kelly] has been working on is the Mother Nature Board, a sort of natural electronic chorus of different animal circuits. It’s all completely random, based on a Really, Really Random Number Generator, and uses a collection of transistors and 555 timers to create pulses sent to a piezo. This circuit is very much sensitive to noise, and while building it [Kelly] found that not all of her 2N3904 transistors were the same; some of them worked for the noise generator, some didn’t. This is a tricky circuit to design, but the results are delightful.</p>\r\n\r\n<p>So, can analog electronics sound like a forest full of crickets? Surprisingly, yes. This demonstration shows what’s possible with a few breadboards full of transistors, caps, resistors, and LEDs. It’s an electronic sculpture of the sounds inspired by the nocturnal soundscape of rural Virginia. You’ve got crickets, cicadas, katydids, frogs, birds, and all the other non-human musicians in the world. Beautiful.</p>', '2018-09-19 18:30:46');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `FK_noticias` (`id_noticia`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id_noticia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id_comentario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id_noticia` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `FK_noticias` FOREIGN KEY (`id_noticia`) REFERENCES `noticias` (`id_noticia`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
