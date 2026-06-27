import json
from kafka import KafkaProducer
import paho.mqtt.client as mqtt


producer = KafkaProducer(
    bootstrap_servers='localhost:29092',  
    value_serializer=lambda v: json.dumps(v).encode('utf-8')
)


MQTT_BROKER = "broker.hivemq.com"
MQTT_PORT = 1883
MQTT_TOPIC = "traffic/data/menofia_national_university"

# لما توصل رسالة من MQTT
def on_message(client, userdata, msg):
    try:
        payload = msg.payload.decode()
        data = json.loads(payload)
        print("📩 استقبلت من MQTT:", data)

        # إرسالها إلى Kafka topic
        producer.send("traffic_topic", value=data)
        producer.flush()
        print("➡️ أُرسلت إلى Kafka topic: traffic_topic\n")

    except Exception as e:
        print("❌ خطأ أثناء الإرسال إلى Kafka:", e)


client = mqtt.Client()
client.on_message = on_message


client.connect(MQTT_BROKER, MQTT_PORT, 60)
client.subscribe(MQTT_TOPIC)
print(f"🚀 متصل بـ MQTT broker: {MQTT_BROKER} ويستمع للـ topic: {MQTT_TOPIC}")


client.loop_forever()
