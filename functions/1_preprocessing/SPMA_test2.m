function [EEG] = SPMA_test2(EEG, opt)
    arguments (Input)
        EEG struct
        % Options
        opt.foo
        % Save options
        opt.Save logical = true
        opt.SaveName string = "test2"
        opt.OutputFolder string = ""
        % Log options
        opt.LogEnabled logical
        opt.LogLevel double {mustBeInteger,mustBeInRange(opt.LogLevel,0,6)}
        opt.LogFileDir string
        opt.LogFileName string
    end

    %% Constants
    module = "preprocessing";

    %% Logger
    logConfig = SPMA_loadConfig(module, "logging", opt);
    log = SPMA_loggerSetUp(module, logConfig);

    %% Test
    EEG.test2 = opt.foo;

    log.info("SPMA_test1")

    if opt.Save
        logParams = unpackStruct(logConfig);
        SPMA_saveData(EEG, "Name", opt.SaveName, "Folder", module, "OutputFolder", opt.OutputFolder, logParams{:});
    end


end

