
{{- define "go-echofc650697-a2f3-4bbb-b71f-9d9f534609dd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc650697-a2f3-4bbb-b71f-9d9f534609dd.fullname" -}}
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


{{- define "go-echofc650697-a2f3-4bbb-b71f-9d9f534609dd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofc650697-a2f3-4bbb-b71f-9d9f534609dd.labels" -}}
helm.sh/chart: {{ include "go-echofc650697-a2f3-4bbb-b71f-9d9f534609dd.chart" . }}
{{ include "go-echofc650697-a2f3-4bbb-b71f-9d9f534609dd.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofc650697-a2f3-4bbb-b71f-9d9f534609dd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofc650697-a2f3-4bbb-b71f-9d9f534609dd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}