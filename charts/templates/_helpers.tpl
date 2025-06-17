
{{- define "go-echoac3c1aa3-6481-4bd1-82e9-db31878220eb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac3c1aa3-6481-4bd1-82e9-db31878220eb.fullname" -}}
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


{{- define "go-echoac3c1aa3-6481-4bd1-82e9-db31878220eb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoac3c1aa3-6481-4bd1-82e9-db31878220eb.labels" -}}
helm.sh/chart: {{ include "go-echoac3c1aa3-6481-4bd1-82e9-db31878220eb.chart" . }}
{{ include "go-echoac3c1aa3-6481-4bd1-82e9-db31878220eb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoac3c1aa3-6481-4bd1-82e9-db31878220eb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoac3c1aa3-6481-4bd1-82e9-db31878220eb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}