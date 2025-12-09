
{{- define "go-echoe41feb3b-1044-40d5-970b-cb480b4f883c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe41feb3b-1044-40d5-970b-cb480b4f883c.fullname" -}}
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


{{- define "go-echoe41feb3b-1044-40d5-970b-cb480b4f883c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe41feb3b-1044-40d5-970b-cb480b4f883c.labels" -}}
helm.sh/chart: {{ include "go-echoe41feb3b-1044-40d5-970b-cb480b4f883c.chart" . }}
{{ include "go-echoe41feb3b-1044-40d5-970b-cb480b4f883c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe41feb3b-1044-40d5-970b-cb480b4f883c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe41feb3b-1044-40d5-970b-cb480b4f883c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}