unit Questor.Model.DAO.Interfaces;

interface

uses
  Data.DB;
type
  iModelDAOInterfaces<T> = interface
    ['{4251C244-7931-4A6A-874C-4F7BAE277841}']
    function DataSource(aValue:TDataSource):iModelDAOInterfaces<T>;
    function Delete : iModelDAOInterfaces<T>;
    function Get : iModelDAOInterfaces<T>;
    function Insert : iModelDAOInterfaces<T>;
    function Update : iModelDAOInterfaces<T>;
    function This : T;
  end;

type
  iModelDAOServices = interface
  ['{C9F66581-AEC4-44C8-8F7C-74E45FE6D00E}']
    function DataSource(aValue:TDataSource) : iModelDAOServices;
    function Delete:iModelDAOServices;
    function Get : iModelDAOServices;
  end;

implementation

end.
