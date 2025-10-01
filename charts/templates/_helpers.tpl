
{{- define "go-echoaaae0918-a701-4c10-9de4-d39f80809234.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaaae0918-a701-4c10-9de4-d39f80809234.fullname" -}}
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


{{- define "go-echoaaae0918-a701-4c10-9de4-d39f80809234.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaaae0918-a701-4c10-9de4-d39f80809234.labels" -}}
helm.sh/chart: {{ include "go-echoaaae0918-a701-4c10-9de4-d39f80809234.chart" . }}
{{ include "go-echoaaae0918-a701-4c10-9de4-d39f80809234.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaaae0918-a701-4c10-9de4-d39f80809234.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaaae0918-a701-4c10-9de4-d39f80809234.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}