//
//  ViewController.swift
//  Alcool ou Gasolina
//
//  Created by Derci Santos on 28/08/2018.
//  Copyright © 2018 Derci Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var precoAlcoolEdit: UITextField!
    @IBOutlet weak var precoGasolinaEdit: UITextField!
    @IBOutlet weak var resultadoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func calcular(_ sender: Any) {
        if let precoAlcool = precoAlcoolEdit.text {
            if let precoGasolina = precoGasolinaEdit.text {
                if self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina) {
                    let resultado = calcularPercentual(alcool: Double(precoAlcool) ?? 0, gasolina: Double(precoGasolina) ?? 0)
                    resultadoLabel.text = "Melhor usar " + (resultado >= 70 ? "Gasolina" : "Alcool")
                } else {
                    resultadoLabel.text = "Ops, preços inválidos!"
                }
            }
        }
    }
    
    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool {
        var camposValidados = true
        
        if precoAlcool.isEmpty {
            camposValidados = false
        } else if precoGasolina.isEmpty {
            camposValidados = false
        }
        
        return camposValidados
    }
    
    func calcularPercentual(alcool: Double, gasolina: Double) -> Double {
        return alcool / gasolina * 100
    }
    
}

