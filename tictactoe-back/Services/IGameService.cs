using System;
namespace tictactoe_back.Services
{
	public interface IGameService
	{
        public string[] initSession(string name);
        public string[] doMove(string name);
        public string[] getState(string name);
        public void stopSession(string name);
    }
}

