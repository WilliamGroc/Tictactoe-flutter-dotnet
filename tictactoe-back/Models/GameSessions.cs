using System;
namespace tictactoe_back.Models
{
	public class GameSessions
	{
		private static GameSessions? instance;

		private Dictionary<string, string[]> sessions = new Dictionary<string, string[]>();

		private GameSessions()
		{

		}

		public string[] createSession(string name)
		{
			this.sessions.Add(name, new string[9]);
			return this.sessions[name];
		}

		public string[] updateSession(string name, int key, string value)
		{
			this.sessions[name][key] = value;
			return this.sessions[name];
		}

		public void removeSession(string name)
		{
			this.sessions.Remove(name);
		}

		public string[] getSession(string name)
		{
			return this.sessions[name];
		}

		public static GameSessions getInstance()
		{
			if (instance == null)
				instance = new GameSessions();

			return instance;
		}
	}
}

