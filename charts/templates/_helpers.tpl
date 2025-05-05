
{{- define "go-echo32655c4b-dccd-426a-8c9e-74655c8f05ac.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32655c4b-dccd-426a-8c9e-74655c8f05ac.fullname" -}}
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


{{- define "go-echo32655c4b-dccd-426a-8c9e-74655c8f05ac.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo32655c4b-dccd-426a-8c9e-74655c8f05ac.labels" -}}
helm.sh/chart: {{ include "go-echo32655c4b-dccd-426a-8c9e-74655c8f05ac.chart" . }}
{{ include "go-echo32655c4b-dccd-426a-8c9e-74655c8f05ac.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo32655c4b-dccd-426a-8c9e-74655c8f05ac.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo32655c4b-dccd-426a-8c9e-74655c8f05ac.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}