﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

// ПРИМЕЧАНИЕ. Команду "Переименовать" в меню "Реструктуризация" можно использовать для одновременного изменения имени класса "Service" в коде, SVC-файле и файле конфигурации.
public class Service : IService
{
    private string connectionString = GetConnectionString();

    static private string GetConnectionString()
    {
        return "Data Source=DESKTOP-4JKHTQ3;Initial Catalog=kaizenCommand; Integrated Security=true;";
    }

    public List<Classifier> GetClassifier()
    {
        List<Classifier> classifierList = new List<Classifier>();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            cmd.CommandText = "GetClassifier";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            
            connection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                classifierList.Add(new Classifier() { Id = int.Parse(reader["id"].ToString()), Name = reader["Name"].ToString() });
            }

            connection.Close();
        }

        return classifierList;
    }

    public List<KaizenCommandType> GetCommandType()
    {
        List<KaizenCommandType> kaizenCommandTypeList = new List<KaizenCommandType>();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            cmd.CommandText = "GetCommandType";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;

            connection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                kaizenCommandTypeList.Add(new KaizenCommandType() { Id = int.Parse(reader["id"].ToString()), Name = reader["Name"].ToString() });
            }

            connection.Close();
        }

        return kaizenCommandTypeList;
    }

    public List<Department> GetDepartment()
    {
        List<Department> departmentList = new List<Department>();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            cmd.CommandText = "GetDepartment";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;

            connection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                departmentList.Add(new Department() { Id = int.Parse(reader["id"].ToString()), Name = reader["Name"].ToString() });
            }

            connection.Close();
        }

        return departmentList;
    }

    public KaizenEvent GetEvent(int eventId)
    {
        KaizenEvent kaizenEvent = new KaizenEvent();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            cmd.CommandText = "GetEvent";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            cmd.Parameters.Add("@eventId", SqlDbType.Int).Value = eventId;

            connection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                kaizenEvent.Id = eventId;
                kaizenEvent.KaIzenEvent = reader["Event"].ToString();
                kaizenEvent.Cause = reader["Cause"].ToString();
                kaizenEvent.Implementation = (int)reader["Implementation"]==1?true:false;
                kaizenEvent.Responsible = reader["Responsible"].ToString();
                kaizenEvent.PlanDate = DateTime.Parse(reader["PlanDate"].ToString());
                kaizenEvent.FaktDate = DateTime.Parse(reader["FaktDate"].ToString());
                kaizenEvent.Resource = reader["Resource"].ToString();
            }

            connection.Close();
        }

        return kaizenEvent;
    }

    public KaizenGoals GetGoals(int goalId)
    {
        KaizenGoals kaizenGoals = new KaizenGoals();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            cmd.CommandText = "GetGoals";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            cmd.Parameters.Add("@goalId", SqlDbType.Int).Value = goalId;

            connection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                kaizenGoals.GoalId = goalId;
                kaizenGoals.WhatEliminate = reader["Event"].ToString();
                kaizenGoals.Measure = reader["Measure"].ToString();
                kaizenGoals.Result = reader["Result"].ToString();
                kaizenGoals.WhenGetResult = reader["WhenGetResult"].ToString();
                kaizenGoals.GoalText = reader["GoalText"].ToString();
            }

            connection.Close();
        }

        return kaizenGoals;
    }

    public KaizenCommand GetKaizenCommand(int commandId)
    {
        KaizenCommand kaizenCommand = new KaizenCommand();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            cmd.CommandText = "GetKaizenCommand";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            cmd.Parameters.Add("@commandId", SqlDbType.Int).Value = commandId;

            connection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                kaizenCommand = new KaizenCommand()
                {
                    Id = commandId,
                    Departmnet = reader["department"].ToString(),
                    CommandName = reader["commandName"].ToString(),
                    CommandType = reader["commandType"].ToString(),
                    Customer = reader["customer"].ToString(),
                    Leader = reader["leader"].ToString(),
                    Subject = reader["subject"].ToString()
                };
            }

            connection.Close();

        }

        return kaizenCommand;
    }

    public List<KaizenCommandMembers> GetKaizenCommandMembers(int commandId)
    {
        List<KaizenCommandMembers> kaizenCommandMembers = new List<KaizenCommandMembers>();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            cmd.CommandText = "GetKaizenCommandMembers";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            cmd.Parameters.Add("@commandId", SqlDbType.Int).Value = commandId;

            connection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                kaizenCommandMembers.Add(new KaizenCommandMembers() { Member = reader["member"].ToString() });
            }

            connection.Close();

        }

        return kaizenCommandMembers;
    }

    public List<KaizenEvent> GetListEvents(int commandId)
    {
        List<KaizenEvent> list = new List<KaizenEvent>();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            cmd.CommandText = "GetListEvents";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            cmd.Parameters.Add("@commandId", SqlDbType.Int).Value = commandId;

            connection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                list.Add(new KaizenEvent() {

                    Id = int.Parse(reader["id"].ToString()),
                    KaIzenEvent = reader["Event"].ToString(),
                    Cause = reader["Cause"].ToString(),
                    Implementation = (int)reader["Implementation"] == 1 ? true : false,
                    Responsible = reader["Responsible"].ToString(),
                    PlanDate = DateTime.Parse(reader["PlanDate"].ToString()),
                    FaktDate = DateTime.Parse(reader["FaktDate"].ToString()),
                    Resource = reader["Resource"].ToString()
                });
            }

            connection.Close();

        }

        return list;
    }

    public List<KaizenGoals> GetListGoals(int commandId)
    {
        List<KaizenGoals> list = new List<KaizenGoals>();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            cmd.CommandText = "GetListEvents";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            cmd.Parameters.Add("@commandId", SqlDbType.Int).Value = commandId;

            connection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                list.Add(new KaizenGoals()
                {
                    GoalId = int.Parse(reader["id"].ToString()),
                    WhatEliminate = reader["Event"].ToString(),
                    Measure = reader["Measure"].ToString(),
                    Result = reader["Result"].ToString(),
                    WhenGetResult = reader["WhenGetResult"].ToString(),
                    GoalText = reader["GoalText"].ToString()
                });
            }

            connection.Close();

        }

        return list;
    }

    public List<KaizenProblem> GetListProblem(int commandId)
    {
        List<KaizenProblem> list = new List<KaizenProblem>();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            cmd.CommandText = "GetListProblem";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            cmd.Parameters.Add("@commandId", SqlDbType.Int).Value = commandId;

            connection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                list.Add(new KaizenProblem()
                {
                    Id = int.Parse(reader["id"].ToString()),
                    ProblemText = reader["ProblemText"].ToString()
                });
            }

            connection.Close();

        }

        return list;
    }

    public List<KaizenRootCauses> GetListRootCauses(int problemId)
    {
        List<KaizenRootCauses> list = new List<KaizenRootCauses>();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            cmd.CommandText = "GetListRootCauses";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            cmd.Parameters.Add("@problemId", SqlDbType.Int).Value = problemId;

            connection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                list.Add(new KaizenRootCauses()
                {
                    CauseId = int.Parse(reader["id"].ToString()),
                    Cause = reader["Cause"].ToString()
                });
            }

            connection.Close();

        }

        return list;
    }

    public KaizenProblem GetProblem(int problemId)
    {
        KaizenProblem kaizenProblem = new KaizenProblem();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            cmd.CommandText = "GetProblem";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            cmd.Parameters.Add("@problemId", SqlDbType.Int).Value = problemId;

            connection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                kaizenProblem = new KaizenProblem()
                {
                    Id = problemId,
                    ProblemText = reader["ProblemText"].ToString(),
                    WhatHappen = reader["WhatHappen"].ToString(),
                    WhereHappen = reader["WhereHappen"].ToString(),
                    WhenHappen = reader["WhenHappen"].ToString(),
                    HowOften = reader["HowOften"].ToString(),
                    HowDoYouKnow = reader["HowDoYouKnow"].ToString(),
                    WhyImportant = reader["WhyImportant"].ToString(),
                    WasWorked = (int)reader["WasWorked"] == 1 ? true : false,
                    Effect = reader["Effect"].ToString(),
                    Fakt1 = reader["Fakt1"].ToString(),
                    Fakt2 = reader["Fakt2"].ToString(),
                    Fakt3 = reader["Fakt3"].ToString(),
                    Fakt4 = reader["Fakt4"].ToString(),
                    Fakt5 = reader["Fakt5"].ToString(),
                    HowSolvelem = reader["HowSolvelem"].ToString(),
                    WhatIdeasIdWorked = reader["WhatIdeasIdWorked"].ToString(),
                    WhyIdeasNotImplemanted = reader["WhyIdeasNotImplemanted"].ToString()
                };
            }

            connection.Close();

        }

        return kaizenProblem;
    }

    public KaizenRootCauses GetRootCauses(int idCause)
    {
        KaizenRootCauses kaizenRootCauses = new KaizenRootCauses();

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader reader;

            cmd.CommandText = "GetListRootCauses";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            cmd.Parameters.Add("@idCause", SqlDbType.Int).Value = idCause;

            connection.Open();

            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                kaizenRootCauses = new KaizenRootCauses()
                {
                    CauseId = idCause,
                    Cause = reader["Cause"].ToString(),
                    Classifier = reader["Classifier"].ToString(),
                    Prioritizing = float.Parse(reader["Prioritizing"].ToString())
                };
            }

            connection.Close();

        }

        return kaizenRootCauses;
    }

    public int SetCommandMembers(DataTable members, int commandId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "SetCommandMembers";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            cmd.Parameters.Add("@members", SqlDbType.Structured).Value = members;
            cmd.Parameters.Add("@commandId", SqlDbType.Int).Value = commandId;

            cmd.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

            connection.Open();

            cmd.ExecuteNonQuery();

            connection.Close();

            int result = (int)cmd.Parameters["@return_value"].Value;

            return result;
        }
    }

    public int SetEvent(string kaizenEvent, int rootCauseId, bool implemantation, string responsible, DateTime planDate, DateTime faktDate, string resource, int commandId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "SetEvent";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            cmd.Parameters.Add("@event", SqlDbType.NVarChar).Value = kaizenEvent;
            cmd.Parameters.Add("@rootCauseId", SqlDbType.Int).Value = rootCauseId;
            cmd.Parameters.Add("@implemantation", SqlDbType.Bit).Value = implemantation==true?1:0;
            cmd.Parameters.Add("@responsible", SqlDbType.NVarChar).Value = responsible;
            cmd.Parameters.Add("@planDate", SqlDbType.DateTime).Value = planDate;
            cmd.Parameters.Add("@faktDate", SqlDbType.DateTime).Value = faktDate;
            cmd.Parameters.Add("@resource", SqlDbType.NVarChar).Value = resource;
            cmd.Parameters.Add("@commandId", SqlDbType.Int).Value = commandId;

            cmd.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

            connection.Open();

            cmd.ExecuteNonQuery();

            connection.Close();

            int result = (int)cmd.Parameters["@return_value"].Value;

            return result;

        }
    }

    public int SetGoals(string whatEliminate, string measure, string result, string whenGetResult, string goalText, int commandId, bool goalAchieved, string comment)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "SetGoals";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            cmd.Parameters.Add("@whatEliminate", SqlDbType.NVarChar).Value = whatEliminate;
            cmd.Parameters.Add("@measure", SqlDbType.NVarChar).Value = measure;
            cmd.Parameters.Add("@result", SqlDbType.NVarChar).Value = result;
            cmd.Parameters.Add("@whenGetResult", SqlDbType.NVarChar).Value = whenGetResult;
            cmd.Parameters.Add("@goalText", SqlDbType.NVarChar).Value = goalText;
            cmd.Parameters.Add("@commandId", SqlDbType.Int).Value = commandId;
            cmd.Parameters.Add("@goalAchieved", SqlDbType.Bit).Value = goalAchieved==true?1:0;
            cmd.Parameters.Add("@comment", SqlDbType.NVarChar).Value = comment;

            cmd.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
            connection.Open();

            cmd.ExecuteNonQuery();

            connection.Close();

            int result1 = (int)cmd.Parameters["@return_value"].Value;

            return result1;
        }
    }

    public int SetKaizenCommand(string leader, string customer, string departmentName, string commandName, int commandTypeId, string subject, int commandId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "SetKaizenCommand";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            cmd.Parameters.Add("@leader", SqlDbType.NVarChar).Value = leader;
            cmd.Parameters.Add("@customer", SqlDbType.NVarChar).Value = customer;
            cmd.Parameters.Add("@departmentName", SqlDbType.NVarChar).Value = departmentName;
            cmd.Parameters.Add("@commandName", SqlDbType.NVarChar).Value = commandName;
            cmd.Parameters.Add("@commandTypeId", SqlDbType.Int).Value = commandTypeId;
            cmd.Parameters.Add("@subject", SqlDbType.NVarChar).Value = subject;
            cmd.Parameters.Add("@commandId", SqlDbType.Int).Value = commandId;

            cmd.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

            connection.Open();

            cmd.ExecuteNonQuery();

            connection.Close();

            int result = (int)cmd.Parameters["@return_value"].Value;

            return result;
        }
    }

    public int SetProblems(string problemText, string whatHappen, string whereHappen, string whenHappen, string howOften, string howDoYouKnow, string whyImportant, bool wasWarked, string effect, 
        string fakt1, string fakt2, string fakt3, string fakt4, string fakt5, string howSolveProblem, string whatIdeasIdWorked, string whyIdeasNotImplemanted, int commandId)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "SetProblems";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            cmd.Parameters.Add("@problemText", SqlDbType.NVarChar).Value = problemText;
            cmd.Parameters.Add("@whatHappen", SqlDbType.NVarChar).Value = whatHappen;
            cmd.Parameters.Add("@whereHappen", SqlDbType.NVarChar).Value = whereHappen;
            cmd.Parameters.Add("@whenHappen", SqlDbType.NVarChar).Value = whenHappen;
            cmd.Parameters.Add("@howOften", SqlDbType.NVarChar).Value = howOften;
            cmd.Parameters.Add("@howDoYouKnow", SqlDbType.NVarChar).Value = howDoYouKnow;
            cmd.Parameters.Add("@whyImportant", SqlDbType.NVarChar).Value = whyImportant;
            cmd.Parameters.Add("@wasWarked", SqlDbType.Bit).Value = wasWarked==true?1:0;
            cmd.Parameters.Add("@effect", SqlDbType.NVarChar).Value = effect;
            cmd.Parameters.Add("@fakt1", SqlDbType.NVarChar).Value = fakt1;
            cmd.Parameters.Add("@fakt2", SqlDbType.NVarChar).Value = fakt2;
            cmd.Parameters.Add("@fakt3", SqlDbType.NVarChar).Value = fakt3;
            cmd.Parameters.Add("@fakt4", SqlDbType.NVarChar).Value = fakt4;
            cmd.Parameters.Add("@fakt5", SqlDbType.NVarChar).Value = fakt5;
            cmd.Parameters.Add("@howSolveProblem", SqlDbType.NVarChar).Value = howSolveProblem;
            cmd.Parameters.Add("@whatIdeasIdWorked", SqlDbType.NVarChar).Value = whatIdeasIdWorked;
            cmd.Parameters.Add("@whyIdeasNotImplemanted", SqlDbType.NVarChar).Value = whyIdeasNotImplemanted;
            cmd.Parameters.Add("@commandId", SqlDbType.Int).Value = commandId;

            cmd.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

            connection.Open();

            cmd.ExecuteNonQuery();

            connection.Close();

            int result = (int)cmd.Parameters["@return_value"].Value;

            return result;
        }
        
    }

    public int SetRootCauses(int problemId, string cause, string classifier, float prioriti)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "SetRootCauses";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = connection;
            cmd.Parameters.Add("@problemId", SqlDbType.Int).Value = problemId;
            cmd.Parameters.Add("@cause", SqlDbType.NVarChar).Value = cause;
            cmd.Parameters.Add("@classifier", SqlDbType.NVarChar).Value = classifier;
            cmd.Parameters.Add("@prioriti", SqlDbType.Float).Value = prioriti;

            cmd.Parameters.Add("@return_value", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;

            connection.Open();

            cmd.ExecuteNonQuery();

            connection.Close();

            int result = (int)cmd.Parameters["@return_value"].Value;

            return result;
        }
    }
}
