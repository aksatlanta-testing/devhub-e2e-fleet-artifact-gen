
{{- define "go-echoe18c0b2f-b707-4ed8-814b-aabfd5f35ade.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe18c0b2f-b707-4ed8-814b-aabfd5f35ade.fullname" -}}
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


{{- define "go-echoe18c0b2f-b707-4ed8-814b-aabfd5f35ade.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe18c0b2f-b707-4ed8-814b-aabfd5f35ade.labels" -}}
helm.sh/chart: {{ include "go-echoe18c0b2f-b707-4ed8-814b-aabfd5f35ade.chart" . }}
{{ include "go-echoe18c0b2f-b707-4ed8-814b-aabfd5f35ade.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe18c0b2f-b707-4ed8-814b-aabfd5f35ade.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe18c0b2f-b707-4ed8-814b-aabfd5f35ade.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}