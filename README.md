# Debit-card-s-number-verification-Luhn-s-algorithm-using-Haskell-functional-programming-

Programme permettant la vérification des numéros de cartes bancaires en appliquant l'algorithme de Luhn et en utilisant le langage Haskell (Programmation fonctionnelle).
        
        
        La plupart des sites de payement en ligne vérifient le numéro de la carte de payement saisie avant de réaliser
la transaction. Ceci permet d’éviter de démarrer une transaction avec un numéro de carte incorrect (avec des
erreurs de saisie). Cette vérification est souvent faite avec une méthode appelée « algorithme de Luhn », crée
par Hans Peter Luhn (https://fr.wikipedia.org/wiki/Formule_de_Luhn).
L’algorithme procède en trois étapes :

1. Multiplie par deux un chiffre sur deux, en commençant par l’avant dernier et en se déplaçant de droite à
gauche. Si le double d’un chiffre est supérieur à neuf (par exemple 2 * 8 = 16), alors il faut le ramener
à un chiffre entre 1 et 9. Pour cela, on soustrait 9 au double. Avec le même exemple, 16 - 9 = 7.

2. La somme de tous les chiffres obtenus est effectuée.

3. Le résultat est divisé par 10. Si le reste de la division est égal à zéro, alors le nombre original est valide.

  Dans ce projet, pour chaque fonction (Fonctions importantes), j'ai également implémenté un test. Le
test est implémenté sous forme d’une liste de Booléens, chacun correspondant à un cas de test. Un cas de test
correspond à l’appel de la fonction comparé au résultat espéré. Par exemple, pour la fonction toDigitsRev le test est :
testToDigitsRev :: [Bool]
testToDigitsRev =
[ toDigitsRev 1234 == [4,3,2,1],
toDigitsRev 0 == [],
toDigitsRev (-17) == [] ]
