
{{- define "go-echoeae380c1-92eb-41a9-88fe-a5c73b1ba09e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeae380c1-92eb-41a9-88fe-a5c73b1ba09e.fullname" -}}
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


{{- define "go-echoeae380c1-92eb-41a9-88fe-a5c73b1ba09e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoeae380c1-92eb-41a9-88fe-a5c73b1ba09e.labels" -}}
helm.sh/chart: {{ include "go-echoeae380c1-92eb-41a9-88fe-a5c73b1ba09e.chart" . }}
{{ include "go-echoeae380c1-92eb-41a9-88fe-a5c73b1ba09e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoeae380c1-92eb-41a9-88fe-a5c73b1ba09e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoeae380c1-92eb-41a9-88fe-a5c73b1ba09e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}