import Foundation

func main() {
    print("Calculadora de Equações Cúbicas")

    while true {
        print("Digite os coeficientes da equação cúbica ax^3 + bx^2 + cx + d = 0")
        print("Digite 'sair' a qualquer momento para encerrar.")

        guard let a = getValidInput(prompt: "a: ") else { break }
        guard let b = getValidInput(prompt: "b: ") else { break }
        guard let c = getValidInput(prompt: "c: ") else { break }
        guard let d = getValidInput(prompt: "d: ") else { break }

        let roots = solveCubicEquation(a: a, b: b, c: c, d: d)
        print("As raízes da equação são: \(roots)")
    }
}

func getValidInput(prompt: String) -> Double? {
    while true {
        print(prompt, terminator: "")
        guard let input = readLine() else { return nil }
        if input.lowercased() == "sair" {
            return nil
        }
        if let value = Double(input) {
            return value
        } else {
            print("Entrada inválida. Por favor, insira um número válido.")
        }
    }
}

func solveCubicEquation(a: Double, b: Double, c: Double, d: Double) -> [Double] {
    let delta0 = b * b - 3 * a * c
    let delta1 = 2 * b * b * b - 9 * a * b * c + 27 * a * a * d

    let discriminant = delta1 * delta1 - 4 * delta0 * delta0 * delta0

    if discriminant > 0 {
        let C = pow((delta1 + sqrt(discriminant)) / 2, 1/3)
        let root1 = -1 / (3 * a) * (b + C + delta0 / C)
        return [root1]
    } else if discriminant == 0 {
        let root1 = -1 / (3 * a) * (b + pow(delta1 / 2, 1/3))
        let root2 = -1 / (3 * a) * (b - pow(delta1 / 2, 1/3))
        return [root1, root2]
    } else {
        let phi = acos(delta1 / (2 * sqrt(delta0 * delta0 * delta0)))
        let root1 = -1 / (3 * a) * (b + 2 * sqrt(delta0) * cos(phi / 3))
        let root2 = -1 / (3 * a) * (b + 2 * sqrt(delta0) * cos((phi + 2 * .pi) / 3))
        let root3 = -1 / (3 * a) * (b + 2 * sqrt(delta0) * cos((phi + 4 * .pi) / 3))
        return [root1, root2, root3]
    }
}

main()
