
{{- define "go-echo6d43ab94-080c-4c74-b895-e6d770e6a170.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6d43ab94-080c-4c74-b895-e6d770e6a170.fullname" -}}
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


{{- define "go-echo6d43ab94-080c-4c74-b895-e6d770e6a170.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6d43ab94-080c-4c74-b895-e6d770e6a170.labels" -}}
helm.sh/chart: {{ include "go-echo6d43ab94-080c-4c74-b895-e6d770e6a170.chart" . }}
{{ include "go-echo6d43ab94-080c-4c74-b895-e6d770e6a170.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6d43ab94-080c-4c74-b895-e6d770e6a170.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6d43ab94-080c-4c74-b895-e6d770e6a170.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}