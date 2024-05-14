const JeuneDiplome = artifacts.require("JeuneDiplome");

contract('JeuneDiplome', (accounts) => {
  let jeuneDiplomeInstance;

  before(async () => {
    jeuneDiplomeInstance = await JeuneDiplome.deployed();
  });

  it('devrait ajouter un établissement et incrémenter NbEtablisements', async () => {
    // Initialiser les données de l'établissement
    const nomInitial = "Institut Supérieur de Technologie";

    // Récupérer le nombre d'établissements avant l'ajout
    const initialCount = await jeuneDiplomeInstance.NbEtablisements();

    // Exécuter la fonction pour ajouter un établissement
    await jeuneDiplomeInstance.ajouter_etablisement(nomInitial, {from: accounts[0]});

    // Vérifier si le nombre d'établissements a été incrémenté
    const newCount = await jeuneDiplomeInstance.NbEtablisements();
    assert.equal(newCount.toNumber(), initialCount.toNumber() + 1, "NbEtablisements n'a pas été incrémenté correctement");

    // Vérifier les détails de l'établissement ajouté
    const etablissement = await jeuneDiplomeInstance.Etablisements(newCount);
    assert.equal(etablissement.nom_etablisement, nomInitial, "Le nom de l'établissement ajouté n'est pas correct");
  });
});
