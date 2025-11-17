
{{- define "go-echo6af22eb8-e782-4b84-9b57-338633f4b5cc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6af22eb8-e782-4b84-9b57-338633f4b5cc.fullname" -}}
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


{{- define "go-echo6af22eb8-e782-4b84-9b57-338633f4b5cc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6af22eb8-e782-4b84-9b57-338633f4b5cc.labels" -}}
helm.sh/chart: {{ include "go-echo6af22eb8-e782-4b84-9b57-338633f4b5cc.chart" . }}
{{ include "go-echo6af22eb8-e782-4b84-9b57-338633f4b5cc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6af22eb8-e782-4b84-9b57-338633f4b5cc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6af22eb8-e782-4b84-9b57-338633f4b5cc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}