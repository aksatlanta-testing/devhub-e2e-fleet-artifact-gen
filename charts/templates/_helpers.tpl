
{{- define "go-echo2395af9f-658e-4f9b-958f-614a2953e158.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2395af9f-658e-4f9b-958f-614a2953e158.fullname" -}}
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


{{- define "go-echo2395af9f-658e-4f9b-958f-614a2953e158.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2395af9f-658e-4f9b-958f-614a2953e158.labels" -}}
helm.sh/chart: {{ include "go-echo2395af9f-658e-4f9b-958f-614a2953e158.chart" . }}
{{ include "go-echo2395af9f-658e-4f9b-958f-614a2953e158.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2395af9f-658e-4f9b-958f-614a2953e158.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2395af9f-658e-4f9b-958f-614a2953e158.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}