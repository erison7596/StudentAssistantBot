from typing import Any, Text, Dict, List
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.events import SlotSet

class ActionGreetUser(Action):
    def name(self) -> Text:
        return "action_greet_user"

    async def run(
        self, dispatcher: CollectingDispatcher,
        tracker: Tracker,
        domain: Dict[Text, Any]
    ) -> List[Dict[Text, Any]]:
        name = tracker.get_slot('name')
        if not name:
            dispatcher.utter_message(text="Oi, Eu sou o seu assistente virtual. Como posso ajudar você hoje?")
        else:
            dispatcher.utter_message(text=f"Oi {name}, Eu sou o seu assistente virtual. Como posso ajudar você hoje?")
        return []
