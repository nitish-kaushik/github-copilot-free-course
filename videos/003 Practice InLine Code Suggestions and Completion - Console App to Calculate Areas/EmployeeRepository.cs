public class EmployeeRepository
{
    private readonly List<Employee> _employees;

    public EmployeeRepository()
    {
        _employees = new List<Employee>();
    }

    public void AddEmployee(Employee employee)
    {
        _employees.Add(employee);
    }

    public List<Employee> GetAllEmployees()
    {
        return _employees;
    }

    public Employee? GetEmployeeById(int id)
    {
        return _employees.FirstOrDefault(e => e.Id == id);
    }

    public void UpdateEmployee(Employee employee)
    {
        var index = _employees.FindIndex(e => e.Id == employee.Id);
        if (index != -1)
        {
            _employees[index] = employee;
        }
    }

    public void DeleteEmployee(int id)
    {
        var employee = GetEmployeeById(id);
        if (employee != null)
        {
            _employees.Remove(employee);
        }
    }

    public void CallthirdPartAPIUsingHttpClient()
    {
        // This method is a placeholder for calling a third-party API using HttpClient.
        // Implementation will depend on the specific API and requirements.
        // Example: HttpClient client = new HttpClient();
        //          var response = await client.GetAsync("https://api.example.com/employees");  
        //          response.EnsureSuccessStatusCode();
        //          var data = await response.Content.ReadAsStringAsync();
        //          Console.WriteLine(data);
        // For now, we will just print a message to the console.
        Console.WriteLine("Calling third-party API using HttpClient...");
    }
}
