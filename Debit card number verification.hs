-- EXO 1
{-
Cette fonction converti un nombre positif dans une liste de nombres, mais avec les chiffres inversés. Pour les nombres négatifs et zéro, la fonction retourne la liste vide
-}
toDigitsRev :: Integer -> [Integer]

toDigitsRev (a)
    |a <= 0 = []
    |mod a 10 == a = [a]
    |otherwise = [mod a 10] ++ toDigitsRev (div a 10)

testToDigitsRev :: [Bool]
testToDigitsRev = [toDigitsRev 1234 == [4,3,2,1],toDigitsRev 0 == [],toDigitsRev (-17) == []]
-- EXO 2
{-
Cette fonction double un nombre sur deux de la liste, en commençant par le second de la liste
-}
doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = zipWith (*) (cycle [1,2])

testDoubleEveryOther :: [Bool]
testDoubleEveryOther = [doubleEveryOther [1,2,3]==[1,4,3],doubleEveryOther[1] == [1],doubleEveryOther [4,5,6] == [4,10,6]]
-- EXO 3
{-
Cette fonction qui, étant donné un entier, s'il est supérieur à 9, le ramene à un chiffre entre 1 et 9. Pour cela, on soustrait 9 au double. Pour les nombres négatifs, la fonction retourne zéro
-}
rem9 :: Integer -> Integer
rem9 (a)
    |a<0=0
    |a>9=a-9
    |otherwise=a
    
testRem9 :: [Bool]
testRem9 = [rem9 10 == 1, rem9 18 == 9, rem9 (-5) == 0, rem9 0 == 0]

-- EXO 4
{-
Cette fonction calcule la somme de touts les nombres d’une liste de chiffres
-}
sumDigits :: [Integer] -> Integer
sumDigits (a)
    |length a == 1 = a!!0
    |otherwise = a!!0 + sumDigits (tail a)

testSumDigits :: [Bool]
testSumDigits = [sumDigits [1,2,3]==6,sumDigits[1] == 1,sumDigits [4,5,6] == 15]
    
-- EXO 5
{-
Cette fonction vérifie si un entier peut être un nombre de carte de payement valide. Ceci utilisera toutes les fonctions précédentes
-}
validate :: Integer -> Bool
validate (a)
    |mod (sumDigits((map (rem9) (doubleEveryOther(toDigitsRev (a))) ))) 10 == 0 = True
    |otherwise = False
    
testValidate :: [Bool]
testValidate = [validate(4974104442486001)==True,validate(4012888888881881)==True,validate(4012888888881840)==True]
-- EXO 6
{-
Cette fonction reçoit les résultats d’un test et retourne vrai si tous les résultats du test sont vrai et faux sinon
-}
test :: [Bool] -> Bool
test (a)
    |head a == False = False
    |length a == 1 && a!!0 == True = True
    |otherwise = test(tail a)
    
testTest :: [Bool]
testTest = [test([False])==False,test([True,True,True])==True,test([True,True,False])==False,test([True])==True]

{-
Cette fonction retourne la chaine de caractères "Success!" si tous les résultats des tests de toutes les fonctions du devoir sont vraies et "Fail!", sinon.
-}

testAll :: [Char]
testAll
    |test([validate(4974104442486001),validate(4012888888881881),validate(4012888888881840)]) == True = "Success!"
    |otherwise = "Fail !"
