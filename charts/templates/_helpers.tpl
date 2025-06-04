
{{- define "go-echof36584ee-418c-44a3-8248-e5b4ee18457d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof36584ee-418c-44a3-8248-e5b4ee18457d.fullname" -}}
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


{{- define "go-echof36584ee-418c-44a3-8248-e5b4ee18457d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof36584ee-418c-44a3-8248-e5b4ee18457d.labels" -}}
helm.sh/chart: {{ include "go-echof36584ee-418c-44a3-8248-e5b4ee18457d.chart" . }}
{{ include "go-echof36584ee-418c-44a3-8248-e5b4ee18457d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof36584ee-418c-44a3-8248-e5b4ee18457d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof36584ee-418c-44a3-8248-e5b4ee18457d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}