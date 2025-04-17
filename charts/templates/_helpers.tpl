
{{- define "go-echo03bb0d06-33c8-4263-a48f-85fd714ffc07.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo03bb0d06-33c8-4263-a48f-85fd714ffc07.fullname" -}}
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


{{- define "go-echo03bb0d06-33c8-4263-a48f-85fd714ffc07.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo03bb0d06-33c8-4263-a48f-85fd714ffc07.labels" -}}
helm.sh/chart: {{ include "go-echo03bb0d06-33c8-4263-a48f-85fd714ffc07.chart" . }}
{{ include "go-echo03bb0d06-33c8-4263-a48f-85fd714ffc07.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo03bb0d06-33c8-4263-a48f-85fd714ffc07.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo03bb0d06-33c8-4263-a48f-85fd714ffc07.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}