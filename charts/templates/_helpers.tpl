
{{- define "go-echobf38120f-bf02-4c55-9b10-86fa033ea342.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf38120f-bf02-4c55-9b10-86fa033ea342.fullname" -}}
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


{{- define "go-echobf38120f-bf02-4c55-9b10-86fa033ea342.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobf38120f-bf02-4c55-9b10-86fa033ea342.labels" -}}
helm.sh/chart: {{ include "go-echobf38120f-bf02-4c55-9b10-86fa033ea342.chart" . }}
{{ include "go-echobf38120f-bf02-4c55-9b10-86fa033ea342.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobf38120f-bf02-4c55-9b10-86fa033ea342.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobf38120f-bf02-4c55-9b10-86fa033ea342.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}