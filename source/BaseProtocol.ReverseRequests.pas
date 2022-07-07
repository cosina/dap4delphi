unit BaseProtocol.ReverseRequests;

interface

uses
  System.Rtti,
  Rest.Json.Types,
  BaseProtocol,
  BaseProtocol.Types;

type
  TRunInTerminalRequestArguments = class(TManaged)
  private type
    TEnvs = TKeyValue;
  private
    [JSONName('kind')]
    FKind: TRunInTerminalRequestArgumentsKind;
    [JSONName('title')]
    FTitle: string;
    [JSONName('cwd')]
    FCwd: string;
    [JSONName('args')]
    FArgs: TArray<string>;
    [JSONName('env'), Managed()]
    FEnv: TEnvs;
  public
    property Kind: TRunInTerminalRequestArgumentsKind read FKind write FKind;
    property Title: string read FTitle write FTitle;
    property Cwd: string read FCwd write FCwd;
    property Args: TArray<string> read FArgs write FArgs;
    property Env: TEnvs read FEnv write FEnv;
  end;

  [RequestCommand(TRequestCommand.RunInTerminal)]
  TRunInTerminalRequest = class(TRequest<TRunInTerminalRequestArguments>);

  TRunInTerminalResponseBody = class(TManaged)
  private
    [JSONName('processId')]
    FProcessId: integer;
    [JSONName('shellProcessId')]
    FShellProcessId: integer;
  public
    property ProcessId: integer read FProcessId write FProcessId;
    property ShellProcessId: integer read FShellProcessId write FShellProcessId;
  end;

  TRunInTerminalResponse = class(TResponse<TRunInTerminalResponseBody>);

implementation

end.
