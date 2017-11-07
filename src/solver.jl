export MINLPBnBSolver

"""
A solver for MINLP problems using a NLP solver and Branch and Bound
"""

type MINLPBnBSolverObj <: MathProgBase.AbstractMathProgSolver
    nl_solver   :: MathProgBase.AbstractMathProgSolver
    options     :: MINLPBnB.SolverOptions
end

function MINLPBnBSolver(nl_solver::MathProgBase.AbstractMathProgSolver;
        log_levels                  = [:Table,:Info,:Timing],
        branch_strategy             = :MostInfeasible,
        # Strong branching
        strong_branching_nvars      = 5,
        strong_branching_nsteps     = 1,
        strong_restart              = true,
        # Obj cuts
        incumbent_constr            = true,
        # :UserLimit
        time_limit                  = Inf,  
        mip_gap                     = 0,
        best_obj_stop               = NaN,
        solution_limit              = 0,
        all_solutions               = false,
        list_of_solutions           = false,
        # Parallel
        processors                  = 1
    )
    options_obj = MINLPBnB.SolverOptions(log_levels,
                                        branch_strategy,
                                        strong_branching_nvars,
                                        strong_branching_nsteps,
                                        strong_restart,
                                        incumbent_constr,
                                        time_limit,
                                        mip_gap,
                                        best_obj_stop,
                                        solution_limit,
                                        all_solutions,
                                        list_of_solutions,
                                        processors)
    return MINLPBnBSolverObj(nl_solver,options_obj)
end