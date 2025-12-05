
{{- define "go-echofd170921-5f1a-4ac8-8cd3-71b8f205cabc.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd170921-5f1a-4ac8-8cd3-71b8f205cabc.fullname" -}}
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


{{- define "go-echofd170921-5f1a-4ac8-8cd3-71b8f205cabc.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofd170921-5f1a-4ac8-8cd3-71b8f205cabc.labels" -}}
helm.sh/chart: {{ include "go-echofd170921-5f1a-4ac8-8cd3-71b8f205cabc.chart" . }}
{{ include "go-echofd170921-5f1a-4ac8-8cd3-71b8f205cabc.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofd170921-5f1a-4ac8-8cd3-71b8f205cabc.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofd170921-5f1a-4ac8-8cd3-71b8f205cabc.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}