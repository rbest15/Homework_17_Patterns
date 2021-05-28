import Foundation

//Предполагает использвание разных стратегий для решений задач. 


class SuareEquationSolver {
    let squareEquation: SquareEquation
    let solver : SuareEquationSolverStrategy
    
    init(squareEquation: SquareEquation, solver : SuareEquationSolverStrategy) {
        self.squareEquation = squareEquation
        self.solver = solver
    }
    
    func answer() -> (Double, Double) {
        return solver.solve(squareEquation: self.squareEquation)
    }
}

class SquareEquation {
    let a : Int
    let b : Int
    let c : Int
    
    init(a: Int, b: Int, c: Int) {
        self.a = a
        self.b = b
        self.c = c
    }
}

protocol SuareEquationSolverStrategy {
    func solve(squareEquation : SquareEquation) -> (Double, Double)
}

class ClassicSolver: SuareEquationSolverStrategy {
    func solve(squareEquation : SquareEquation) -> (Double, Double) {
        let a = Double(squareEquation.a)
        let b = Double(squareEquation.b)
        let c = Double(squareEquation.c)
        
        let d = pow(b, 2) -  4 * a * c
        let sqD = sqrt(d)
        let x1 = (-b + sqD) / (2 * a)
        let x2 = (-b - sqD) / (2 * a)
        
        return (x1, x2)
    }
}

class VietaSolver: SuareEquationSolverStrategy {
    func solve(squareEquation : SquareEquation) -> (Double, Double) {
        let a = Double(squareEquation.a)
        let b = Double(squareEquation.b)
        let c = Double(squareEquation.c)
        
        let v1 = -b / a
        let v2 = c / a
        
        var x1 : Double = 0
        var x2 : Double = 0
        
        //Алгоритм Виета не добил пока что =(
        repeat {
            x1 -= 0.1
            x2 += 0.1
        } while x1 + x2 - v1 >= 0.1 && x1 + x2 - v1 <= -0.1 && x1 * x2 - v2 >= 0.1 && x1 * x2 - v2 <= -0.1
        
        return (x1, x2)
    }
}

func strategy() {
    let solver = SuareEquationSolver(squareEquation: SquareEquation(a: -6, b: 3, c: 1), solver: ClassicSolver())
    print(solver.answer())
    
    let solver2 = SuareEquationSolver(squareEquation: SquareEquation(a: -6, b: 3, c: 1), solver: VietaSolver())
    print(solver2.answer())
}
