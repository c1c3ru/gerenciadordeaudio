# gerenciadordeaudios

Um gerenciador de audios com Bloc
main.dart: Este é o ponto de entrada do aplicativo. Ele configura o AudioApp e fornece a lista de áudios para reprodução.

AudioApp: Esta é a tela principal do aplicativo, que inclui a lista de áudios e os controles do player de áudio.

audio.dart: Define a classe Audio para representar um áudio com título e URL.

audio_event.dart: Define os eventos relacionados ao áudio, como PlayAudio e PauseAudio.

audio_state.dart: Define o estado do áudio, incluindo o áudio atual em reprodução e se está sendo reproduzido ou pausado.

audio_bloc.dart: Contém a lógica de negócios relacionada ao áudio, incluindo a reprodução e pausa do áudio.

audio_player_controls.dart: É um widget para exibir os controles do player de áudio, como reproduzir e pausar.

## Getting Started

# Gerenciador de Áudios em Flutter

Este é um aplicativo Flutter para gerenciar e reproduzir áudios. Ele demonstra o uso de BLoC para gerenciar o estado da reprodução de áudio e o uso de uma lista de áudios.

## Funcionalidades

- Lista de áudios disponíveis para reprodução.
- Controles de reprodução para tocar e pausar áudios.

## Como Executar

Para executar este aplicativo, siga os passos abaixo:

1. Certifique-se de ter o Flutter instalado em sua máquina. Se não, siga as [instruções de instalação do Flutter](https://flutter.dev/docs/get-started/install).

2. Clone este repositório:

   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
