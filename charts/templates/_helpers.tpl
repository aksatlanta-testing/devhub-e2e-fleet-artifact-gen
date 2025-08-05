
{{- define "go-echo82458d94-c24f-4e5f-9d5f-4b3a177f9a45.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo82458d94-c24f-4e5f-9d5f-4b3a177f9a45.fullname" -}}
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


{{- define "go-echo82458d94-c24f-4e5f-9d5f-4b3a177f9a45.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo82458d94-c24f-4e5f-9d5f-4b3a177f9a45.labels" -}}
helm.sh/chart: {{ include "go-echo82458d94-c24f-4e5f-9d5f-4b3a177f9a45.chart" . }}
{{ include "go-echo82458d94-c24f-4e5f-9d5f-4b3a177f9a45.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo82458d94-c24f-4e5f-9d5f-4b3a177f9a45.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo82458d94-c24f-4e5f-9d5f-4b3a177f9a45.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}