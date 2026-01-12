
{{- define "go-echofc9c890e-633f-4b3e-8f1b-860421e4dca4.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc9c890e-633f-4b3e-8f1b-860421e4dca4.fullname" -}}
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


{{- define "go-echofc9c890e-633f-4b3e-8f1b-860421e4dca4.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc9c890e-633f-4b3e-8f1b-860421e4dca4.labels" -}}
helm.sh/chart: {{ include "go-echofc9c890e-633f-4b3e-8f1b-860421e4dca4.chart" . }}
{{ include "go-echofc9c890e-633f-4b3e-8f1b-860421e4dca4.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofc9c890e-633f-4b3e-8f1b-860421e4dca4.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofc9c890e-633f-4b3e-8f1b-860421e4dca4.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}