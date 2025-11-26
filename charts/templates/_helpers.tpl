
{{- define "go-echod0c54cb7-3669-4059-80d4-013530839b74.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0c54cb7-3669-4059-80d4-013530839b74.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echod0c54cb7-3669-4059-80d4-013530839b74.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod0c54cb7-3669-4059-80d4-013530839b74.labels" -}}
helm.sh/chart: {{ include "go-echod0c54cb7-3669-4059-80d4-013530839b74.chart" . }}
{{ include "go-echod0c54cb7-3669-4059-80d4-013530839b74.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod0c54cb7-3669-4059-80d4-013530839b74.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod0c54cb7-3669-4059-80d4-013530839b74.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}