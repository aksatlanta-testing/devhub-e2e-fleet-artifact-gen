
{{- define "go-echod95e1fea-6ac1-4660-9303-d43dfe9fd09b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod95e1fea-6ac1-4660-9303-d43dfe9fd09b.fullname" -}}
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


{{- define "go-echod95e1fea-6ac1-4660-9303-d43dfe9fd09b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod95e1fea-6ac1-4660-9303-d43dfe9fd09b.labels" -}}
helm.sh/chart: {{ include "go-echod95e1fea-6ac1-4660-9303-d43dfe9fd09b.chart" . }}
{{ include "go-echod95e1fea-6ac1-4660-9303-d43dfe9fd09b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod95e1fea-6ac1-4660-9303-d43dfe9fd09b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod95e1fea-6ac1-4660-9303-d43dfe9fd09b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}